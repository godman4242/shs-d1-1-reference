#!/usr/bin/env python3
"""
shs_resource_decrypt.py — decrypt the Straw Hat Samurai: Duels resource SWFs.

The game's ResourceManager.as downloads each resource library, then decrypts
it with a byte-swap + XOR scheme before handing it to the Flash runtime.

Decryption (decompiled ResourceManager.decryptByteArray):

    key = filename.charCodeAt(1)          # the SECOND character of the filename
    ba  = copy(input)
    for i in range(3, 256):
        if i % 11 == 0:
            swap ba[i] <-> ba[i + 256]
        ba[i] ^= key

Only bytes 3..255 are touched; bytes 0..2 are the SWF signature ("CWS"),
and the rest of the file is left alone.

Usage:
    python3 shs_resource_decrypt.py <file.swf>            # -> <file>.dec.swf
    python3 shs_resource_decrypt.py <file.swf> -o out.swf
    python3 shs_resource_decrypt.py <file.swf> --check    # validate only

Exit codes: 0 ok, 2 fatal (unreadable / bad signature / not decrypted).
"""
import argparse
import os
import sys


def decrypt(data: bytes, filename: str) -> bytes:
    """Apply the game's decryption. `filename` must be the ORIGINAL name."""
    if len(filename) < 2:
        raise ValueError("filename too short to derive a key")
    key = ord(filename[1]) & 0xFF

    ba = bytearray(data)
    for i in range(3, 256):
        if i % 11 == 0 and (i + 256) < len(ba):
            ba[i], ba[i + 256] = ba[i + 256], ba[i]
        ba[i] ^= key
    return bytes(ba)


def looks_like_swf(data: bytes) -> bool:
    return data[:3] in (b"FWS", b"CWS", b"ZWS")


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__,
                                 formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("path")
    ap.add_argument("-o", "--out", help="output path (default: <name>.dec.swf)")
    ap.add_argument("--check", action="store_true",
                    help="report whether the file decrypts to a valid SWF; write nothing")
    args = ap.parse_args()

    try:
        data = open(args.path, "rb").read()
    except OSError as e:
        print(f"FATAL: cannot read {args.path}: {e}", file=sys.stderr)
        return 2

    if not data:
        print(f"FATAL: {args.path} is empty", file=sys.stderr)
        return 2

    # The key is derived from the ORIGINAL filename, so use the real basename.
    original = os.path.basename(args.path)
    if original.endswith(".dec.swf"):
        original = original[: -len(".dec.swf")]

    try:
        out = decrypt(data, original)
    except ValueError as e:
        print(f"FATAL: {e}", file=sys.stderr)
        return 2

    ok = looks_like_swf(out)
    print(f"{original}: key=0x{ord(original[1]):02x} ('{original[1]}') "
          f"in={len(data)}B out={len(out)}B swf_header={'OK' if ok else 'BAD'}")

    if args.check:
        return 0 if ok else 2

    dest = args.out or (args.path[:-4] + ".dec.swf" if args.path.endswith(".swf")
                         else args.path + ".dec.swf")
    try:
        with open(dest, "wb") as fh:
            fh.write(out)
    except OSError as e:
        print(f"FATAL: cannot write {dest}: {e}", file=sys.stderr)
        return 2
    print(f"wrote {dest}")
    return 0 if ok else 2


if __name__ == "__main__":
    sys.exit(main())
