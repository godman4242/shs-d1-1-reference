#!/usr/bin/env python3
"""
shs_strings_extract.py — recover the Straw Hat Samurai: Duels English string table.

The client (LangManager.as) fetches:
    <gameFS>/lang/shs3_en.xml

That file is an XLIFF 1.0 document, UTF-16 encoded, and shipped with one
upstream defect: a bare "&" that makes it not well-formed XML (see
docs/research/STRING_TABLE_RECOVERY.md).

The upstream Android build only ever shipped a PARTIAL table (id range
0..2533, 2555 entries). The web build ships the FULL table
(id range 0..11515, 3166 entries). Recovering the web table removes the
need for the -3060 id-offset heuristic.

Usage:
    python3 shs_strings_extract.py <raw_shs3_en.xml>            # summary
    python3 shs_strings_extract.py <raw_shs3_en.xml> --dump     # TSV
    python3 shs_strings_extract.py <raw_shs3_en.xml> --json out.json

Exit codes: 0 ok, 2 fatal (unreadable / no entries).
"""
import argparse
import json
import re
import sys
import xml.etree.ElementTree as ET

# A bare ampersand: not the start of a numeric or named XML entity.
BARE_AMP = re.compile(r"&(?!(?:#\d+|#x[0-9a-fA-F]+|[a-zA-Z][a-zA-Z0-9]*);)")


def decode_bytes(raw: bytes) -> str:
    """The shipped file is UTF-16 (BOM or not) — decode leniently."""
    for enc in ("utf-16", "utf-8", "latin-1"):
        try:
            return raw.decode(enc)
        except (UnicodeDecodeError, UnicodeError):
            continue
    raise ValueError("cannot decode string table")


def repair(text: str) -> tuple[str, int]:
    """Escape bare ampersands so the XLIFF parses. Returns (text, fix_count)."""
    fixed, n = BARE_AMP.subn("&amp;", text)
    return fixed, n


def parse(raw: bytes):
    text = decode_bytes(raw)
    fixed, amp_fixes = repair(text)
    root = ET.fromstring(fixed)

    strings: dict[str, str] = {}
    empty = 0
    for unit in root.findall(".//trans-unit"):
        key = unit.get("id")
        if key is None:
            continue
        src = unit.find("source")
        val = (src.text or "").strip() if src is not None else ""
        if not val:
            empty += 1
        strings[key] = val

    numeric = sorted(int(k) for k in strings if k.lstrip("-").isdigit())
    return {
        "root_tag": root.tag,
        "lang": root.attrib.get("{http://www.w3.org/XML/1998/namespace}lang", ""),
        "version": root.attrib.get("version", ""),
        "trans_units": len(strings),
        "non_empty": sum(1 for v in strings.values() if v),
        "empty": empty,
        "id_min": min(numeric) if numeric else None,
        "id_max": max(numeric) if numeric else None,
        "bare_ampersand_fixes": amp_fixes,
        "bytes": len(raw),
        "strings": strings,
    }


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__,
                                 formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("path")
    ap.add_argument("--dump", action="store_true", help="write id<TAB>text to stdout")
    ap.add_argument("--json", metavar="OUT", help="write a JSON map to OUT")
    ap.add_argument("--only-missing", metavar="IDS", type=int, nargs="+",
                    help="print only these numeric ids")
    args = ap.parse_args()

    try:
        raw = open(args.path, "rb").read()
    except OSError as e:
        print(f"FATAL: cannot read {args.path}: {e}", file=sys.stderr)
        return 2

    try:
        info = parse(raw)
    except Exception as e:
        print(f"FATAL: cannot parse {args.path}: {type(e).__name__}: {e}", file=sys.stderr)
        return 2

    if info["trans_units"] == 0:
        print(f"FATAL: {args.path} yielded no trans-units", file=sys.stderr)
        return 2

    strings = info.pop("strings")

    if args.only_missing is not None:
        for i in args.only_missing:
            print(f"{i}\t{strings.get(str(i), '<MISSING>')}")
        return 0

    if args.dump:
        for k in sorted(strings, key=lambda x: (not x.lstrip("-").isdigit(),
                                                int(x) if x.lstrip("-").isdigit() else 0)):
            print(f"{k}\t{strings[k]}")
    if args.json:
        with open(args.json, "w", encoding="utf-8") as fh:
            json.dump(strings, fh, ensure_ascii=False, indent=1, sort_keys=True)

    if not args.dump and not args.json:
        print(f"file        : {args.path}")
        print(f"root        : {info['root_tag']} v{info['version']} lang={info['lang']!r}")
        print(f"trans-units : {info['trans_units']} "
              f"(non-empty {info['non_empty']}, empty {info['empty']})")
        print(f"id range    : {info['id_min']} .. {info['id_max']}")
        print(f"amp fixes   : {info['bare_ampersand_fixes']} bare '&' repaired")
        print(f"bytes       : {info['bytes']}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
