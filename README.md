# SHS:Duels 1:1 — Reference Corpus

This is the pile of digging I did to rebuild *Straw Hat Samurai: Duels* from scratch. Decompiled client code, decrypted data tables, ripped audio, extracted artwork — all of it, so the actual game doesn't have to be excavated twice.

If you're here to make a 1:1 recreation, this should save you months.

---

## What the game was

*Straw Hat Samurai: Duels* was a Flash multiplayer samurai MMORPG. It came out on the web in 2015, got an Android port in 2016, and the servers died sometime after that. It was a 2D side-scroller where you drew lines to slash, queued up combos on a timer, and grinded quests for levels and elements.

## How the corpus was put together

Three sources, all preserved:

**The code.** 2,597 AS3 files staged here out of a 3,567-file corpus — the full web client (`web-v0.717/`), the Android client (`android-v0.682/`), and the three-stage preloader chain (`shs3-loader/`, `shs3-stage2/`, `shs3-stage3/`) that decrypts the payload at runtime. Plus the two predecessors, `shs1/` and `shs2/`, which is where the combat roots live.

**The data.** The Android build's numbers, decrypted and byte-exact. `questdata.xml` has all 61 quests with every line of dialogue, 225 steps, and a 471-choice branch graph. `npcdata.xml` has 495 NPCs. `itemdata.xml` has 982 items. `skilldata.xml` has 75 skills across 182 level rows. Every number in this repo came out of these files rather than being typed in by hand.

**The video.** 2,675 frames pulled from two 1080p longplays (zFtCaTO0_1M and Nr4fQstqHDM on FlashGamesArchive). This is the ground truth for anything the code doesn't tell you — how a hit actually looks, what the music does in a boss fight, the exact colours on screen.

## Where to look for what

| You're building… | Read this first | Then this |
|---|---|---|
| **Combat** — line-drawing slashes, meters, stances | `docs/systems/combat-core.md` | `docs/systems/skills-meters.md` |
| **The story** — 61 quests, 40,013 words, 14 chapters | `docs/systems/quests-story.md` + `data/questdata.xml` | `docs/research/WEB_DIALOGUE_STORYLINE.md` |
| **Progression** — XP, levels, survival waves | `docs/systems/progression.md` | `docs/systems/rebirth-elements.md` |
| **Items and shop** — 982 items, gold tiers, sell prices | `docs/systems/items-equipment.md` + `data/itemdata.xml` | `docs/systems/economy.md` |
| **The world** — maps, towns, enemies, spawns | `docs/systems/world-exploration.md` | `docs/systems/enemies-ai.md` |
| **UI and HUD** — what's on screen, exact colours | `docs/systems/ui-hud.md` | `docs/systems/art-anim-audio-feel.md` |
| **Audio** — 13 SFX and 13 music stems | `audio/` | `docs/systems/art-anim-audio-feel.md` (adaptive-music engine spec) |
| **Animations** — frame-by-frame timings | `data/anim_xml.txt` + `data/android-bins/*AnimationData.bin` | `docs/research/MOTION_MEASUREMENTS.md` |
| **Multiplayer** — the server API, inferred from the client | `docs/systems/meta-social.md` | gap #1 below |
| **How to decrypt or verify anything here** | `tools/` | `docs/recovery/RECOVERY.md` |

## The three source layers

### Code (`decompiled/`)
- `web-v0.717/` — the full web client, AS3, obfuscated names mostly mapped back to something readable
- `android-v0.682/` — same engine, different numbers
- `shs3-loader/`, `shs3-stage2/`, `shs3-stage3/` — the preloader chain that decrypts the payload at runtime
- `shs1/`, `shs2/` — the two earlier single-player games, where the combat roots live

Start here:

- `ResourceManager.as` lines 205-214 — the XOR+swap crypto, the whole thing in a dozen lines
- `QuestEngine` and `QuestGenerator` — the entire quest runtime
- `SoundManager` — 43 SFX names
- `MusicManager` — the adaptive music system
- the `playerio` library — the multiplayer API the dead server implemented

### Data (`data/`)
- `questdata.xml` (796 KB) — 61 quests, all dialogue, 225 steps, 471-choice branch graph, per-chapter XP and loot
- `npcdata.xml` (228 KB) — 495 NPCs
- `itemdata.xml` (184 KB) — 982 items
- `skilldata.xml` (39 KB) — 75 skills × 182 level rows
- `anim_xml.txt` — animation data
- `ui_strings.txt` — UI strings (the web build streamed more from the server)
- `android-bins/` — the 42 raw encrypted resource blobs exactly as they ship in the APK; the keys are in `tools/`
- `bindata/` — the web payload's raw binary blobs

### Audio (`audio/`)
Recovered 2026-10-29, verified playable.

- `sfx/` — 13 original SFX: slash1-3, deflect, hitmetal, punch, die1-3, goodkoto, fart, sumo, refund, safepercussion
- `music/` — 13 music stems: battledrums, battlechants, flutes, dungeonambience/flute/percussion/piano, safeambience/koto/percussion, bgm_gangnam, bgm_levelup, bgm_lose
- `decoded-resource-swfs/` — the two decrypted CWS SWFs they came out of, so you can check my extraction against the source with FFDec

Every file matches the ledger's sample counts exactly — safepercussion is 882,144 samples, which is 80.01 seconds at 11 kHz.

## Wayback captures (`wayback/`)

Found 2026-10-29, and they're good.

- `shs3_payload_2016-11-30.swf` (6.9 MB) — the web client exactly as the site served it on 2016-11-30. All 27 embedded data blobs are byte-identical to the copy I already had, which is independent proof the chain of custody holds. Decode with `tools/payload_decode.py` (XOR key 104).
- `shsduels_zip_2016-08-13/` — the official standalone distribution zip: `shsduels.swf` (a preloader shell — the real game streamed in), 7 official screenshots, and the developer's own `game description.txt`
- `wiki-png-official-2016/` — 43 official wiki images, saved from the live wiki before it died

What I never found: the 5 runtime-streamed resource SWFs (`soundresource.swf`, `musicresource.swf`, `shs3resource.swf`, `imageresource.swf`, `bgresource.swf`). They were never archived by anyone. The audio in `audio/` came from the Android build, which is a different set of sounds from the web build.

## The verified-facts ledger (`docs/`)

This is the part that makes the rest trustworthy.

- `docs/systems/*.md` — 12 system docs. Every number in them was measured out of source code or video frames, and every claim carries a **Cite** (exact file and line) plus the **Evidence** it was drawn from
- `docs/CLAIMS.md` (364 KB) and `docs/LEDGER_EVIDENCE.md` (606 KB) — the full claim ledger
- `docs/SALVAGE.md` — every "this is structurally unrecoverable" entry, overturned, with the method that did it
- `docs/journal.md` — 16 verification runs, each one trying to break the last
- `docs/research/` — master reference, video-study synthesis (2,675 frames, 60 segment notes), motion measurements, the web-vs-Android divergence list, Kongregate forum findings, the web dialogue reconstruction (347 events)
- `docs/recovery/` — how to rebuild this whole corpus from nothing: every source URL and the verification command for each

## Things that are still missing

Written down so nobody wastes time hunting for them.

1. **The server.** The PlayerIO MMORPG backend went dark around 2016 and there's nothing left to recover. It has to be **re-designed** — the `playerio` calls in `decompiled/web-v0.717/` are the API contract. Clan wars, PvP tournaments, matchmaking and save format are all re-design work.
2. **Web wording.** `questdata.xml` is the Android text. The web version survives only as OCR in `docs/research/WEB_DIALOGUE_STORYLINE.md` (347 events; 169 of them share no four-word phrase with the Android text). Where they disagree, **the web wording wins**.
3. **Web audio.** Only 13 of the 43 SFX have recovered waveforms. The other 30 are still targets for synth-from-video. → **Resolved 2026-10-29** — the web `soundresource.swf` came off the Player.io CDN alive and decrypted: all 44 SFX are there as original assets, 31 of them missing from this repo. See `docs/research/RESOURCE_LIBRARIES_RECOVERY.md`.
4. **Web-vs-Android numbers.** Focus is 192 on web and 120 on Android, behead is ×1.3 vs ×1.5, survival waves run 33-39, sell prices and gold tiers differ by 5×. Full list in `docs/research/DIVERGENCES.md`.
5. **Portraits and chapter splash cards.** 67 portraits and 14 splash cards lived in `imageresource.swf`, which was never archived — only video frames held them. → **Resolved 2026-10-29** — `imageresource.swf` came off the Player.io CDN (`/res/` path) and decrypted. 21 resource images, 26 payload images and 2 backgrounds are on disk now, under `audio/live-web-v0.682/images/`. See `docs/research/RESOURCE_LIBRARY_RECOVERY.md`.
6. **XP curve past level 10.** A soft unknown. Measure it off the video.
7. **String table.** → **Resolved 2026-10-29** — the complete web string table (`shs3_en.xml`, 3,165 entries, ids 0..11515) came off the Player.io CDN. It supersedes the partial 2,555-entry mobile table, closes blocker **L1b**, and retires the −3060 id-offset heuristic: item names now resolve 821/821 at offset 0. See `docs/research/STRING_TABLE_RECOVERY.md`.

## Verifying it yourself

```bash
# Decrypt any resource blob (key = charCodeAt(1) of its name, so 'h' = 104 for shs3resource):
python3 tools/payload_decode.py <blob.bin> <key>   # → CWS SWF (zlib inside)

# Decrypt a live resource SWF (key comes from the filename, don't pass it in):
python3 tools/shs_resource_decrypt.py soundresource.swf          # → soundresource.dec.swf
python3 tools/shs_resource_decrypt.py soundresource.swf --check  # validate only

# Read the recovered string table (handles the upstream bare-& defect):
python3 tools/shs_strings_extract.py data/live-cdn-capture-v0.682-v0.706/shs3_en_web_v0.706.xml
python3 tools/shs_strings_extract.py <file> --only-missing 4000 4172

# The transform itself, from ResourceManager.as:205-214:
#   for i in 3..255: if i%11==0 swap ba[i]<->ba[i+256]; ba[i] ^= key
# Keys: shs3resource=104  bgresource=103  imageresource=109
#       musicresource=117 soundresource=111
```

## Provenance

Corpus owner: Kheshav (godman4242). Assembled from preserved client files, an APK extraction, and two 1080p longplay videos (zFtCaTO0_1M, Nr4fQstqHDM — FlashGamesArchive).

Verification harness: 16 adversarial runs, cite-lint on every claim, fail-closed gates. Details in `docs/journal.md`.

If this repo ever gets lost, `docs/recovery/RECOVERY.md` has the full rebuild instructions.
