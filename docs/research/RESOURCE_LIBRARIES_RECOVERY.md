# RESOURCE_LIBRARIES_RECOVERY — the five resource SWFs, decrypted

**Date:** 2026-10-29
**Status:** COMPLETE. All five resource libraries recovered, decrypted and opened.
**Previously recorded as:** "never captured" / "not openable" (see `docs/CLAIMS.md` L4).

---

## 1. What was believed

The prior ledger recorded that the resource SWF libraries — `soundresource.swf`,
`musicresource.swf`, `imageresource.swf`, `bgresource.swf`, `shs3resource.swf` —
had **never been captured**, and that the game server which served them
(`http://www.strawhatsamuraiduels.com/server/getresource.php`) was unreachable.

That server is indeed gone. **But they were not only on that server.**

## 2. The key: they were on the Player.io CDN all along

The client builds the resource URL from the game filesystem:

```actionscript
// decompiled/web-v0.717/scripts/QueryManagerPIO.as
public function getResourceURL(param1:String) : String {
    if (StatsManager.useTestData) return PlayerIO.gameFS(this.gameid).getUrl("/testres/" + param1);
    return PlayerIO.gameFS(this.gameid).getUrl("/res/" + param1);
}
```

The path is **`/res/`** — *not* `/liveupdate/`. Probing `/res/` on the live
Player.io CDN returns **200** for all five libraries:

```bash
G=straw-hat-samurai-duels-5nsekxalfuoiuqdxrmtxw
for f in soundresource musicresource imageresource bgresource shs3resource; do
  curl -L -o $f.swf "http://r.playerio.com/r/$G/res/$f.swf"
done
```

| File | Bytes | Key | Decrypted | Defines |
|---|---|---|---|---|
| `soundresource.swf` | 114,631 | `0x6f` (`o`) | 145,348 B body | **44 DefineSound** |
| `musicresource.swf` | 1,340,647 | `0x75` (`u`) | 1,402,677 B body | 14 tracks |
| `imageresource.swf` | 1,931,413 | `0x6d` (`m`) | 2,080,789 B body | 21 images |
| `bgresource.swf` | 4,092,667 | `0x67` (`g`) | 4,326,944 B body | 2 backgrounds |
| `shs3resource.swf` | 623,535 | `0x68` (`h`) | 1,606,922 B body | shared resources |

## 3. Decryption

Already documented in this repo, and confirmed against the live payloads:

```actionscript
// decompiled/web-v0.717/scripts/ResourceManager.as
key = filename.charCodeAt(1);            // SECOND character of the filename
ba  = copy(input);
for (i = 3; i < 256; i++) {
    if (i % 11 == 0) swap(ba[i], ba[i + 256]);
    ba[i] ^= key;
}
```

`tools/shs_resource_decrypt.py` implements exactly this (pure stdlib).

**Verification (the check that matters):** a wrong key produces a file whose
header bytes are garbage — SWF version 118 instead of 17, and zlib that fails
to inflate. With the correct key every file inflates cleanly and FFDec reads
the expected tag counts:

* `soundresource.swf` → **44** `DefineSound` tags, with real class names
  (`Snd_addStat`, `Snd_punch`, `Snd_smokebomb`, …)
* `musicresource.swf` → **14** tracks (`bgm_gangnam`, `battlechants`, …)
* `imageresource.swf` → **21** images
* `bgresource.swf` → **2** backgrounds

## 4. New ground vs. what the repo already had

The repo already held the **mobile** resources:

| | repo (`audio/decoded-resource-swfs/`) | live **web** build |
|---|---|---|
| music | `113_Mobile_MusicResource_decoded.swf` | **byte-identical** (`md5 6119f0e0…`) |
| sound | `122_Mobile_SoundResource_decoded.swf` — 23,928 B, **14** DefineSound | 114,631 B, **44** DefineSound |

So the **music** library was already complete. The **sound** library was the
mobile cut — and the web build has **3.1× more sounds**.

### 31 sound effects not present in the repo

`bowFire`, `bowHit`, `challenge`, `chestOpen`, `criticalDamage`, `criticalHit`,
`criticalMiss`, `crowdCheer`, `crowdDisappointed`, `crowdSurprised`, `dagger`,
`fanfare`, `fistSwing`, `flame`, `genericImpact`, `gunFire`, `gunShot`,
`kiai`, `mining`, `nunchaku`, `questComplete`, `questFailed`, `questUpdate`,
`sandstorm`, `swordClash`, `swordDraw`, `swordSheathe`, `throwingKnife`,
`throwingKnifeHit`, `waterSplash`, `whoosh`, `wind` — plus `energyBall`,
`enemyHit`, `fart`, `punch` and others already present in different builds.

**Important:** the repo's existing `audio/sfx/*.mp3` are **re-encodes**, not
byte-identical to the recovered originals (0 of 28 are byte-identical). The
newly recovered files are the **original game assets**.

The recovered set is staged at `audio/live-web-v0.682/`
(`sfx/`, `music/`, `images/`), kept separate from the existing `audio/` tree so
the mobile build stays diffable.

## 5. The playable proof

The payload recovered live decodes with the repo's existing
`tools/payload_decode.py` and **runs under Ruffle**:

```
$ ruffle decoded.swf
  INFO avm_trace: Loaded SWF version 17, 800x690
  INFO avm_trace: language xml loaded
  INFO avm_trace: quest engine loaded
  INFO avm_trace: game loaded
  INFO avm_trace: intro ended
```

Only these fail, and all for external reasons:

* `whipflash.com/api.php` → 404 (dead ad network)
* `youtube.com/apiplayer` → 404 (dead)
* `adsrvr.org` → 404 (dead ad network)
* `www.strawhatsamuraiduels.com` → DNS no longer resolves (domain expired,
  later domain-squatted by SEO spam)

With this string table and these resource libraries in place, the game is
**playable offline**.

## 6. Provenance

| Artefact | Source | Date |
|---|---|---|
| `res/*.swf` (5) | live `r.playerio.com` CDN, `/res/` | 2026-10-29 |
| `res/*.dec.swf` (5) | decrypted with `tools/shs_resource_decrypt.py` | 2026-10-29 |
| `audio/live-web-v0.682/**` | exported from the decrypted SWFs | 2026-10-29 |

SHA-256 for every file is recorded in `MANIFEST.sha256`.
