# SHS:Duels 1:1 Recreation — Complete Reference Corpus

> **What this is:** an unlicensed fan research archive assembled to make a faithful recreation of *Straw Hat Samurai: Duels* possible. It contains decompiled client code, decrypted data tables, recovered audio, and extracted artwork from the 2015–2016 game by Explosive Barrel / Lut Games.

**Everything a person needs to recreate *Straw Hat Samurai: Duels* without redoing the archaeology.**

> ⚠️ **Legal note, read first.** All original rights belong to Lut Games / Explosive Barrel. **No formal permission has been obtained from the rights holder yet.** Redistribution of these files may violate copyright and/or the original game's terms of service. Use this corpus as research material for your own recreation; do not re-host, sell, or claim these files as your own. Wiki text: CC-BY-SA (cite, don't paste).

---

## The one-paragraph story

*Straw Hat Samurai: Duels* was a Flash multiplayer samurai MMORPG (web 2015 → Android 2016 → dead server ~2016). This corpus reconstructs it from three sources: the **decompiled client code** (2,597 AS3 files staged here from a 3,567-file corpus, obfuscation mostly mapped), the **decrypted game data** (quests/skills/NPCs/items/survival — byte-exact, 100% of the numbers), and **2,675 video frames** from two 1080p longplays (the visual/audio ground truth). Every fact is verified against exact evidence with a cross-run adversarial process — **1,384 upheld claims** of 1,785 examined (339 killed, 62 not upheld — see `docs/LEDGER_EVIDENCE.json`), verified across the adversarial harness runs recorded in `docs/journal.md`.

## Repo map — where to look for what

| You want to build… | Open first | Then |
|---|---|---|
| **Combat** (draw-a-line slashing, meters, stances) | `docs/systems/combat-core.md` | `docs/systems/skills-meters.md` |
| **The story** (61 quests, 40,013 words, 14 chapters) | `docs/systems/quests-story.md` + `data/questdata.xml` | `docs/research/WEB_DIALOGUE_STORYLINE.md` |
| **Progression** (XP, levels, survival waves) | `docs/systems/progression.md` | `docs/systems/rebirth-elements.md` |
| **Items & shop** (982 items, gold tiers, sell prices) | `docs/systems/items-equipment.md` + `data/itemdata.xml` | `docs/systems/economy.md` |
| **The world** (maps, towns, enemies, spawns) | `docs/systems/world-exploration.md` | `docs/systems/enemies-ai.md` |
| **UI/HUD** (what the screen shows, exact colors) | `docs/systems/ui-hud.md` | `docs/systems/art-anim-audio-feel.md` |
| **Audio** (13 SFX + 13 music stems — the recovered MP3s) | `audio/` | `docs/systems/art-anim-audio-feel.md` (adaptive-music engine spec) |
| **Animations** (frame-by-frame timings) | `data/anim_xml.txt` + `data/android-bins/*AnimationData.bin` | `docs/research/MOTION_MEASUREMENTS.md` |
| **Multiplayer design** (the server's API, from the client's calls) | `docs/systems/meta-social.md` | gap #1 below |
| **How to decrypt/verify anything here** | `tools/` | `docs/recovery/RECOVERY.md` |

## The three source layers

### 1. Decompiled code (`decompiled/`)
- `web-v0.717/` — the full web client, AS3, obfuscated names mostly mapped
- `android-v0.682/` — the Android client (same engine, different data numbers)
- `shs3-loader/`, `shs3-stage2/`, `shs3-stage3/` — the preloader chain that decrypts the payload at runtime
- `shs1/`, `shs2/` — the two predecessor single-player games (combat roots)
- Start with: `ResourceManager.as` (the XOR+swap crypto, lines 205-214), `QuestEngine`/`QuestGenerator` (the whole quest runtime), `SoundManager` (43 SFX names), `MusicManager` (adaptive music), the `playerio` lib (the multiplayer API the server implemented)

### 2. Game data (`data/`) — the Android build's numbers
- `questdata.xml` (796 KB) — 61 quests, all dialogue, 225 steps, 471-choice branch graph, per-chapter XP/loot
- `npcdata.xml` (228 KB) — 495 NPCs
- `itemdata.xml` (184 KB) — 982 items
- `skilldata.xml` (39 KB) — 75 skills × 182 level rows
- `anim_xml.txt` — animation data
- `ui_strings.txt` — UI strings (the web build streamed more from the server)
- `android-bins/` — the 42 raw encrypted resource blobs exactly as they ship in the APK (keys in `tools/` decrypt each)
- `bindata/` — the web payload's raw binary blobs

### 3. Audio (`audio/`) — recovered 2026-10-29, verified playable
- `sfx/` — 13 original SFX: slash1-3, deflect, hitmetal, punch, die1-3, goodkoto, fart, sumo, refund, safepercussion
- `music/` — 13 music stems: battledrums, battlechants, flutes, dungeonambience/flute/percussion/piano, safeambience/koto/percussion, bgm_gangnam, bgm_levelup, bgm_lose
- `decoded-resource-swfs/` — the two decrypted CWS SWFs they were extracted from (verify our extraction: re-run FFDec or use `tools/`)
- Every file byte-matches the ledger's sample counts (e.g. safepercussion = 882,144 samples = 80.01 s at 11 kHz)

## Wayback captures (`wayback/`) — found 2026-10-29
- `shs3_payload_2016-11-30.swf` (6.9 MB) — the web client exactly as the site served it on 2016-11-30. **All 27 embedded data blobs are byte-identical to the preserved copy** — independent proof of chain-of-custody. Decode with `tools/payload_decode.py` (XOR key 104).
- `shsduels_zip_2016-08-13/` — the official standalone distribution zip: `shsduels.swf` (a preloader shell — the real game streamed), 7 official screenshots, `game description.txt` (the developer's own description)
- `wiki-png-official-2016/` — 43 official wiki images saved from the live wiki before it died
- **Not found** (confirmed never captured): the 5 runtime-streamed resource SWFs (`soundresource.swf`, `musicresource.swf`, `shs3resource.swf`, `imageresource.swf`, `bgresource.swf`) — the web build's audio is **unrecoverable**; the Android audio in `audio/` is the only recovered audio.

## The verified-facts ledger (`docs/`) — why this repo is trustworthy
- `docs/systems/*.md` — 12 system docs; every number measured from source code or video frames; each claim carries a **Cite** (exact file+line) and **Evidence** (the actual quote/parse output)
- `docs/CLAIMS.md` (364 KB) + `docs/LEDGER_EVIDENCE.md` (606 KB) — the full claim ledger, ~394 upheld claims
- `docs/SALVAGE.md` — every "structurally unrecoverable" entry overturned, with the method
- `docs/journal.md` — the 16-run verification history
- `docs/research/` — master reference, video-study synthesis (2,675 frames, 60 segment notes), motion measurements, the web-vs-Android divergences list, Kongregate forum findings, the web dialogue reconstruction (347 events)
- `docs/recovery/` — how to rebuild this corpus from nothing (all source URLs + verification commands)

## Known gaps — so nobody hunts ghosts
1. **The server.** PlayerIO MMORPG backend, dead ~2016. Nothing to recover — it must be **re-designed** (the client's `playerio` calls in `decompiled/web-v0.717/` are the API contract). Clan wars, PvP tournaments, matchmaking, save format are re-design work.
2. **Web wording.** `questdata.xml` is Android wording. Web wording survives only as OCR in `docs/research/WEB_DIALOGUE_STORYLINE.md` (347 events; 169 share no 4-word phrase with Android). Ruling: **web wins** where they diverge.
3. ~~**Web audio.** Only 13 of 43 SFX have recovered waveforms — 30 remain synth-from-video targets.~~ **RESOLVED 2026-10-29 — the web `soundresource.swf` was recovered live from the Player.io CDN and decrypted: all 44 SFX are present as original assets** (31 of them absent from this repo). See `docs/research/RESOURCE_LIBRARIES_RECOVERY.md`.
4. **Web-vs-Android numbers.** Known divergences (Focus 192 vs 120, behead ×1.3 vs ×1.5, survival waves 33-39, sell prices, gold tiers 5×) — full list in `docs/research/DIVERGENCES.md`.
5. ~~**Portraits + chapter splash cards.** 67 portraits + 14 splash cards lived in the never-captured `imageresource.swf` — only video frames hold them.~~ **RESOLVED 2026-10-29 — `imageresource.swf` was recovered live from the Player.io CDN (`/res/` path) and decrypted. 21 resource images + 26 payload images + 2 backgrounds are now on disk** at `audio/live-web-v0.682/images/`. See `docs/research/RESOURCE_LIBRARY_RECOVERY.md`.
6. **XP curve beyond L10.** Soft unknown; measure from video.
7. ~~**String table.**~~ **RESOLVED 2026-10-29 — the complete web string table (`shs3_en.xml`, 3,165 entries, id range 0..11515) was recovered live from the Player.io CDN.** It supersedes the partial 2,555-entry mobile table, closes blocker **L1b**, and retires the −3060 id-offset heuristic (item names now resolve 821/821 at offset 0). See `docs/research/STRING_TABLE_RECOVERY.md`.

## Verify anything yourself (`tools/`)
```bash
# Decrypt any resource blob (key = charCodeAt(1) of its name, e.g. 'h'=104 for shs3resource):
python3 tools/payload_decode.py <blob.bin> <key>   # → CWS SWF (zlib inside)

# Decrypt a live resource SWF (key is derived from the filename, not passed in):
python3 tools/shs_resource_decrypt.py soundresource.swf          # → soundresource.dec.swf
python3 tools/shs_resource_decrypt.py soundresource.swf --check  # validate only

# Read the recovered string table (handles the upstream bare-& defect):
python3 tools/shs_strings_extract.py data/live-cdn-capture-v0.682-v0.706/shs3_en_web_v0.706.xml
python3 tools/shs_strings_extract.py <file> --only-missing 4000 4172

# The transform, from ResourceManager.as:205-214:
#   for i in 3..255: if i%11==0 swap ba[i]<->ba[i+256]; ba[i] ^= key
# Keys: shs3resource=104  bgresource=103  imageresource=109
#       musicresource=117 soundresource=111
```

## Provenance
- Corpus owner: Kheshav (godman4242). Assembled from preserved client files, APK extraction, and two 1080p longplay videos (zFtCaTO0_1M, Nr4fQstqHDM — FlashGamesArchive).
- Verification harness: 16 adversarial runs, cite-lint on every claim, fail-closed gates (`docs/journal.md`).
- Full rebuild instructions if this repo is lost: `docs/recovery/RECOVERY.md`.
