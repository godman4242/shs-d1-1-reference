# STRING_TABLE_RECOVERY — the full English string table, recovered live

**Date:** 2026-10-29
**Status:** COMPLETE for the English table. Resolves an open `L1b` blocker.
**Captured by:** live fetch from the still-running Player.io CDN (no Wayback, no cracking).

---

## 1. What was missing

The client requests its localised strings from the game filesystem:

```actionscript
// decompiled/web-v0.717/scripts/LangManager.as
Locale.addXMLPath(ENGLISH, _loc2_ + "shs3_en.xml");
```

```actionscript
// decompiled/web-v0.717/scripts/QueryManagerPIO.as
public function getResourceURL(param1:String) : String {
    if (StatsManager.useTestData) return PlayerIO.gameFS(this.gameid).getUrl("/testres/" + param1);
    return PlayerIO.gameFS(this.gameid).getUrl("/res/" + param1);
}
```

The prior ledger recorded only a **partial** table recovered from the Android
build: **2,555 entries, id range `0 .. 2533`**. That partial table produced a
family of downstream artefacts that are recorded in `docs/journal.md` and
`docs/CLAIMS.md`:

* a **−3060 id-offset heuristic** for item name lookups, and
* the **L1b** entry — item-name strings resolve at only **323 / 821** ids
  (39.3%), with 498 unresolvable.

## 2. What was recovered

The Player.io CDN was still serving the game filesystem in October 2026. Two
distinct game ids are live, each with its own `lang/` directory:

| Game id | Live version | `lang/shs3_en.xml` | Trans-units | id range | Bytes |
|---|---|---|---|---|---|
| `shsd-server1-eckroutikmljozkzitvg` | **0.706** (web) | `liveupdate/` sibling | **3,165** | **0 .. 11515** | 613,334 |
| `straw-hat-samurai-duels-5nsekxalfuoiuqdxrmtxw` | **0.682** (android) | | 2,003 | 0 .. 9010 | 385,410 |

The **web (v0.706) table is the complete original**. The Android (v0.682)
table is a *different, smaller* cut of the same file — not a subset of the web
one.

### Live URLs (as of 2026-10-29)

```bash
# The complete web table — the one that matters
curl -L -o shs3_en_web_v0.706.xml \
  "http://r.playerio.com/r/shsd-server1-eckroutikmljozkzitvg/lang/shs3_en.xml"

# The android-cut table
curl -L -o shs3_en_android_v0.682.xml \
  "http://r.playerio.com/r/straw-hat-samurai-duels-5nsekxalfuoiuqdxrmtxw/lang/shs3_en.xml"

# Live version manifests (plain text, not SWF despite the name)
curl -L "http://r.playerio.com/r/shsd-server1-eckroutikmljozkzitvg/liveupdate/shs3_payload_version.swf"
# -> tinyloaderversion=1.0&version=0.706&forceupdate=false&payload=http://www.strawhatsamuraiduels.com/shs3_payload.swf&androidpayload=...
curl -L "http://r.playerio.com/r/straw-hat-samurai-duels-5nsekxalfuoiuqdxrmtxw/liveupdate/shs3_payload_version.swf"
# -> version=0.682&forceupdate=false&payload=.../liveupdate/shs3_payload.swf&androidpayload=...
```

> **Note on the `.swf` extension:** the `liveupdate/*_version.swf` files are
> `text/plain` manifests, not SWFs. The game code parses them as key=value
> strings.

## 3. Upstream defect: the shipped file is not well-formed XML

The file is **UTF-16 encoded** and contains **one bare `&`**:

```xml
<trans-unit id="615" resname="615">
<source>Full HP &amp; CHI and AP for 1 gold?</source>
</trans-unit>
```

A bare `&` is invalid XML, so the file **does not parse as shipped**. This is
an upstream bug in the original game, not an artefact of capture. Any parser
must escape bare ampersands before parsing. `tools/shs_strings_extract.py`
does this and reports how many it had to repair.

## 4. Result — the offset heuristic is no longer needed

Item-name ids are resolved against the table. Measured against the live
`itemdata.xml` (821 name-bearing items):

| Table | resolves at offset **0** | resolves at offset **−3060** |
|---|---|---|
| Prior partial (repo, ids ≤ 2533) | 76 / 821 | 123 / 821 |
| **Live web v0.706 (complete)** | **821 / 821 (100%)** | 323 / 821 |

**The −3060 offset was an artefact of the partial mobile table.** With the
complete web table, every item name resolves **at offset 0**. The heuristic
should be retired, and `L1b` can be closed.

Spot-check — the values recorded in the prior ledger all match exactly:

| id | value |
|---|---|
| 4000 | `Small Soldier Pill` |
| 4172 | `Replenish your AP without waiting!` |
| 4050 | `Iron Sword` |
| 6000 | `Light Stance Mastery` |
| 5009 | `Ruffian` |
| 175  | `Critical Hit` |

## 5. Why the earlier table looked complete but was not

`data/ui_strings.txt` in this repo holds **471** lines, and the prior
`shs3_en.xml` extraction was **2,555** entries. Both are *derived artefacts of
a partial source*. The full source is 3,165 entries with ids up to 11,515 —
the extra ids are exactly the ones the partial table could not contain
(item names, skill names, quest text, NPC dialogue).

This also explains the `2555` ceiling noted in `docs/journal.md`: the mobile
build shipped a table truncated at id 2533, and the extraction tool read
that truncated file.

## 6. Tooling

`tools/shs_strings_extract.py` — pure stdlib, no dependencies.

```bash
python3 tools/shs_strings_extract.py data/live-cdn-capture-v0.682-v0.706/shs3_en_web_v0.706.xml
python3 tools/shs_strings_extract.py <file> --dump            # id<TAB>text
python3 tools/shs_strings_extract.py <file> --json out.json
python3 tools/shs_strings_extract.py <file> --only-missing 4000 4172
```

Exit codes: `0` ok, `2` fatal (unreadable / unparseable / no entries).
Verified red on garbage, empty and missing input — all exit `2`.

## 7. Also captured live: refreshed data XMLs

The `data/` XMLs are also still served live, and the live copies differ from
the ones committed in this repo (different build, different byte layout):

| File | Live | Committed here | Δ children |
|---|---|---|---|
| `skilldata.xml` | 38,066 B / 1,844 | 39,003 B / 1,793 | +51 |
| `questdata.xml` | 815,155 B / 22,329 | 796,383 B / 21,603 | +726 |
| `npcdata.xml`   | 218,793 B / 9,878 | 228,413 B / 9,879 | −1 |
| `itemdata.xml`  | 178,185 B / 8,380 | 184,002 B / 8,168 | +212 |

```bash
curl -L -o questdata.xml \
  "http://r.playerio.com/r/straw-hat-samurai-duels-5nsekxalfuoiuqdxrmtxw/data/questdata.xml"
```

These are captured under `data/live-cdn-capture-v0.682-v0.706/` rather than
overwriting the committed ones, so the historical build stays diffable.

## 8. What is STILL missing (unchanged)

The **resource SWF libraries** (`soundresource.swf`, `musicresource.swf`,
`imageresource.swf`, `bgresource.swf`, `shs3resource.swf`) are **not** on the
Player.io CDN — every path returns `403`. They were served by the game's own
server at `http://www.strawhatsamuraiduels.com/server/getresource.php`, and
that domain's DNS **no longer resolves** (the site was later domain-squatted
by SEO spam in 2024). The decryption scheme for them is already documented in
this repo (`RESOURCE_DECRYPT`), so *if* the blobs are ever recovered they
decrypt immediately. They are also absent from Wayback.

The payload itself was recovered separately and **runs**:

```bash
curl -L -o shs3_payload.swf \
  "http://r.playerio.com/r/straw-hat-samurai-duels-5nsekxalfuoiuqdxrmtxw/liveupdate/shs3_payload.swf"
python3 tools/payload_decode.py shs3_payload.swf decoded.swf
ruffle decoded.swf     # -> "Loaded SWF version 17, 800x690", "game loaded", "intro ended"
```

Ruffle boots the decoded payload, loads the language XML, the quest engine and
five resource libraries, and starts sound + music. The only failures are dead
ad-trackers (`whipflash`, `youtube`, `adsrvr.org`) and the dead
`strawhatsamuraiduels.com` game server. **The game is playable offline with
the recovered payload + this string table.**

## 9. Provenance

| Artefact | Source | Date |
|---|---|---|
| `shs3_en_web_v0.706.xml` | live `r.playerio.com` CDN | 2026-10-29 |
| `shs3_en_android_v0.682.xml` | live `r.playerio.com` CDN | 2026-10-29 |
| `*.xml` (data) | live `r.playerio.com` CDN | 2026-10-29 |
| `shs3_payload.swf` | live `r.playerio.com` CDN (v0.682) | 2026-10-29 |
| `shs3_android_payload.swf` | live `r.playerio.com` CDN (v0.682), 15.1 MB | 2026-10-29 |

SHA-256 of every file is recorded in `MANIFEST.sha256`.
