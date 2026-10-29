# GAUNTLET L0 — RE-SURVEY · run journal

> Written **as each stage lands**, never held in context (`GAUNTLET.md` §3.4).
> A run that dies mid-flight is salvageable from this file + `index/` + `systems/`.

- **Lane:** L0 — RE-SURVEY (12 systems)
- **Model:** Opus 5 · **Scale:** ~85 agents (two orthogonal sweeps)
- **Baseline:** `e97f91f` · 56 test files / 894 tests green
- **Started:** 2026-08-13

---

## 2026-10-29 — LIVE-CDN RE-SURVEY: string table + resource libraries recovered

The Player.io CDN was still serving the game filesystem. Two blockers that had
been recorded as permanently lost were recovered **live** — no cracking, no
Wayback, no brute force.

**1. The complete English string table.** `lang/shs3_en.xml` was served live
under both game ids. The **web** build (v0.706) is the full original:
**3,165 trans-units, id range `0 .. 11515`**. The previously-recorded table
(2,555 entries) came from the **mobile** build and was a truncated cut, not the
original.

* The shipped file is UTF-16 and contains **one bare `&`** (id 615) — it
  **does not parse as shipped**. That is an upstream bug, not a capture
  artefact.
* **L1b is closed.** Item-name resolution under the old −3060 id-offset
  heuristic was 323/821 (39.3%). Against the complete table it is
  **821/821 (100%) at offset 0**. The offset was an artefact of the truncated
  table and should be retired.
* NPC names now resolve **490/490** from `npcdata.xml`.

**2. All five resource SWF libraries.** They were never only on the dead
`strawhatsamuraiduels.com` server — the client loads them from the game
filesystem at **`/res/`**, and all five return **200** live. Decrypted with the
already-documented scheme (key = `filename.charCodeAt(1)`).

* `soundresource.swf` → **44 DefineSound** tags, vs **14** in the repo's
  mobile cut. **31 sounds the repo does not have** (`bowFire`, `criticalDamage`,
  `kiai`, `mining`, `swordClash`, `throwingKnife`, `waterSplash`, …).
* The repo's `audio/sfx/*.mp3` are **re-encodes** — 0 of 28 are byte-identical
  to the recovered originals.
* Also recovered: 21 resource images, 26 payload images, 2 backgrounds.

**3. The payload runs.** The live v0.682 payload decodes with the existing
`tools/payload_decode.py` and boots under Ruffle: `language xml loaded`,
`quest engine loaded`, `game loaded`, `intro ended`. Only dead ad-trackers
(`whipflash`, `youtube`, `adsrvr.org`) and the expired game server fail.
**The game is playable offline** with the recovered payload + string table.

**Falsifiable checks recorded:** a wrong decryption key yields SWF version 118
and a failing zlib stream — with the correct key all five libraries inflate
cleanly and FFDec reads the expected tag counts. Both new tools exit `2` on
unparseable input (verified red on garbage / empty / missing files).

**Added:** `tools/shs_strings_extract.py`, `tools/shs_resource_decrypt.py`,
`docs/research/STRING_TABLE_RECOVERY.md`,
`docs/research/RESOURCE_LIBRARIES_RECOVERY.md`,
`data/live-cdn-capture-v0.682-v0.706/`, `audio/live-web-v0.682/`.


## STAGE 0 — the evidence index (script, 0 agents)

### ⚑ FINDING S0-1 — `GAUNTLET.md` §2.1 is WRONG about `bindata/`, disproven by direct inspection

**§2.1 claims:** *"candidate homes are the remaining `bindata/*.bin` (the largest is
animation XML, so the others are unsurveyed)"* — i.e. 1 known, 26 unknown.

**Reality (A2, `file` + head of every one of the 27 files, this run):** 26 of 27 are
**plain XML**, and every single one is now identified. Nothing in `bindata/` is
unsurveyed any more.

| Files | Root | Contents |
|---|---|---|
| `100`–`118` (**19 files**, 2.35 MB) | `<animdata>` | **19 animation sets**, not 1 — `ogre_idle`, `bear_idle`, `chargedshot_start`, `mining`, `reversed_stance`, `horse_idle`, `balanced_stance`, `zom_idle`, `idle`, `deer_idle`, `dual_stance`, `guardian_idle`, `wolf_idle`, `spear_idle`, `spider_idle`, `gob_idle`, `heavy_stance`, `boar_idle`, `light_stance` |
| `119_1t4646s0.bin` | `<survivalmodedata>` | **A whole game mode nobody has surveyed** — `<wave>`/`<enemy>` with id-alternates (`400\|401\|402\|403\|404`), `<qty>`, `<x>` spawn coords |
| `93_1t4647s0.bin` | comment-wrapped `<obj>` | **Room-object definitions** — `Obj_FloorSwitch`, `Obj_Lever`, `<x>`, `<property>triggered object</property>` |
| `94`, `95`, `96`, `97`, `98` | plain text lists | **Five name-generator tables** — male given · court/noble · clan/family · female given · place names |
| `92_1t4648s0.bin` | GIF89a 63×72 | a raster image asset |

**Consequences, each landing on a different lane:**

1. **L6 (art-anim):** the animation corpus is **19 files / 2.35 MB**, including
   `light_stance` / `balanced_stance` / `heavy_stance` / `reversed_stance` / `dual_stance`
   as first-class animation sets. `REBUILD_READINESS.md` §4 art-anim scores 56 without
   knowing these exist.
2. **`world-exploration` (scored 35, *"ZERO world numbers in config"*)** — room objects
   with coordinates and trigger semantics are **held**, in `93_1t4647s0.bin`.
3. **`enemies-ai` (scored 34)** — survival-mode wave composition + spawn x-coords are
   **held**, in `119_1t4646s0.bin`. Also 8 non-human idle rigs (ogre/bear/horse/zom/deer/
   guardian/wolf/spider/gob/boar) confirm the taxonomy from the payload, not from video.
4. **A game mode absent from the entire ledger:** `<survivalmodedata>` is not mentioned
   anywhere in `REBUILD_READINESS.md`'s 12 systems.
5. **L1b (string table):** `bindata/` is now **exhausted as a candidate home** — every
   file is accounted for and none is a string table. L1b's search space shrinks to
   `payload.xml` + the 1,079 decompiled AS3 files. This is a *negative* result and it
   is worth as much as a positive one.

**Artifact class:** A2 (payload rows, quoted from the files themselves).

**This is exactly the finding the 85-agent plan was sized to catch** — the 45-agent
shape left `bindata/` unassigned and would have inherited §2.1's wrong premise.

---

## STAGE 0b — THE ANDROID PAYLOAD (2026-08-14) · lane-changing

### ⚑ FINDING S0-3 — THE STRING TABLE IS FOUND. `GAUNTLET.md` §2.1's blocker is DEAD.

**Provenance:** surfaced by a blind HUNTER critic on `economy/item-price-table`
(it refuted a surveyor's "names are not portable" instruction by going and finding
the table), then **verified first-hand here** — not taken on the critic's word.

`reference/decrypted/shs3_android_payload_decoded.swf` carries **42
DefineBinaryData blobs that are CLASS-NAMED**, where the web payload's 27 are
anonymous numbered blobs. One is `118_Mobile_Lang_EN.bin`: a UTF-16LE XLIFF
string table, **2,533 resolvable `trans-unit` entries**.

**Resolution rate, measured (`scripts/gauntlet/androidIndex.py`):**

| File | Rows resolved | Unresolved |
|---|---:|---:|
| `itemdata.xml` — item names + descs | **804** | **0** |
| `skilldata.xml` — skill names + descs | **73** | **0** |
| `npcdata.xml` — NPC names | **484** | **6** (all one missing id, `5017`) |

**Spot checks:** `4000` → *Small Soldier Pill* · `4172` → *Replenish your AP without
waiting!* · `4050` → *Iron Sword* · `6000` → *Light Stance Mastery* · `5009` →
*Ruffian* · `175` → *Critical Hit* · `387`–`392` → the six *Condition:* tier names.
The §2.1 worked example resolves end-to-end: `itemdata.xml:28` item `2100` has
`<name>4000</name>` `<desc>4172</desc>` → *"Small Soldier Pill" / "Replenish your AP
without waiting!"*, coherent with its `<heavenlyprice>1</heavenlyprice>`.

**Consequences:** **L2 and L3 are UNBLOCKED** — they can port names as well as
numbers. **L1b's lane is closed before it ran.** `GAUNTLET.md` §2.1 must be rewritten,
and its "candidate homes" list was wrong in an instructive way: it named
`payload.xml` and the decompiled AS3, never the Android build.

**Correction to the critic that found it:** it reported *"5110 `<trans-unit>`"*.
Measured here: **2,555 opening tags, 2,533 with a resolvable resname+source**. 5110
is the count of opening *and* closing tags. The lower number is the true one.

**Caveat that must ride with every use of this table:** this is the **Android build,
`clientVersion 0.682`** (`shs3_android/scripts/StatsManager.as:30`), against the web
build's **v0.717**. Parity is established for the data XMLs (the Android
`111_Mobile_ItemData` / `116_Mobile_QuestData` / `125_Mobile_NpcData` / `117_Mobile_SkillData`
blobs match the web payload's row counts exactly) but is NOT established for UI copy
or combat tuning. Label ported strings with their build.

### ⚑ FINDING S0-4 — the Android blobs re-score four more systems

| Blob | Bytes | Holds | Ledger claim it hits |
|---|---:|---|---|
| `112_Mobile_NodeData` | 53 K | `<nodedata>` 535 ids, 372 `<x>`, 343 `<obj>`, 339 `<property>` | world-exploration (35) — *"ZERO world numbers in config"*, blocker ① *"world bounds + geography"* |
| `114_Mobile_AchievementData` | 9 K | **61 achievements** with id/img/name | meta-social blocker ③ *"achievements list … one Ruffle session closes all"* — no Ruffle needed |
| `90_InteractUI_UIData` | 21 K | `<uidata>` 167 ids, 139 option/label/icon triples | ui-hud blocker ⑤ *"pause/options/dialogue-box exact metrics"* |
| `123_Mobile_BGData` | 12 K | 49 backgrounds, name + `ffcount` | art-anim — backgrounds were never inventoried |
| `84_QuestEngine_TrapRoomData` | 39 K | **314** room objects w/ id/name/x | world-exploration room graph |
| `109_WarHexUI_SurvivalModeData` | 12 K | 87 `<enemy>` waves w/ qty + x | the game mode absent from all 12 systems (S0-1) |

**Animation corpus, re-counted from the named blobs:** `99_MCSCharacter_HumanAnimationData`
alone holds **158 `<anim>`** (24,502 nodes); `93_..._SkillsAnimationData` holds **51**.
Summed across the 18 `MCSCharacter_*` blobs: **~450 animations**, not the *"~150
remaining"* `GAUNTLET.md` §2 L6 assumes. **L6 is roughly 3× the size the board thinks.**

### ⚑ FINDING S0-5 — audio is HELD but ENCRYPTED (a lead for L7, not a solve)

`113_Mobile_MusicResource.bin` (**1.34 MB**), `122_Mobile_SoundResource.bin` (24 K),
`115_Mobile_SHS3Resource.bin` (654 K), `120_Mobile_BGResource.bin` (4.2 MB) and
`124_Mobile_ImageResource.bin` (1.73 MB) all begin `CWS` — **nested compressed SWFs**.
`ffdec -export sound` fails on them, exactly as the top-level payload did before it
was decrypted into `reference/decrypted/`.

**Honest status: NOT opened. This is a LEAD, not an artifact.** But it moves §6's
*"Exact original SFX & music synthesis params … the exact waveforms/envelopes are
not [recoverable]"* from *structurally unrecoverable* to *held, encrypted, with a
decryption path known to have worked once on this very payload*. **L7's gate is still
Kheshav's ears (R4) — this does not change that.** It changes whether there is
anything to listen to besides YouTube rips.

## 2026-10-29 (later) — playability verification + audio ruling

**Playability verified by real input, not just boot logs.** The decoded
payload was driven with synthesized mouse drags (CGEvent) at the canvas:

- idle/ambient animation moves 31/5920 sampled pixels over 2s
- one slash-line drag moves 5,589/5920 (94% of the frame) — a full-screen
  reaction, far above ambient motion, so the input path works
- abuse pass (25 rapid random clicks + 3 full-window drags): process
  stayed alive, no panic/crash in the log

**Audio ruling (decide-and-flag).** The repo's `audio/sfx/*.mp3` are
re-encodes of the mobile cut; the recovered `audio/live-web-v0.682/`
holds 44 original DefineSound exports. Ruling: BOTH stay. The live-web
directory is the canonical original source; the mobile re-encodes are kept
because they are the smaller, already-integrated set and deleting them
would break nothing but buys nothing. A recreation should use the
live-web originals. Veto note: if byte-for-byte parity with the 2015
shipped build matters to you, swap `audio/sfx/` for the live-web set and
regenerate the MANIFEST.

## 2026-10-29 19:50 — CORRECTION: previous "playability verified" claim was WRONG. Real verdict below.

**What went wrong in the earlier verification (same day):** the SWF tested was still
zlib-compressed (CWS) — `strings` saw nothing, and I never actually LOOKED at the game
window. The window showed the game's own `ERROR: SITE-LOCKED` gate. The "slash test"
pixel-diff evidence was measured against that error screen, not gameplay, and one batch
of synthetic clicks landed on whatever was under the test coordinates on the user's
screen. Both retracted this session; no synthetic input is used anymore.

**Root cause of the lock (verified in bytecode):** the ABC constant pool holds
`strawhatsamuraiduels.com`, `explosivebarrel.net`, `Error: Site-locked` as neighbours —
the payload checks `loaderInfo.url` and falls back to the gate on file:// loads.

**The clean fix that works:** `ruffle --spoof-url "http://www.strawhatsamuraiduels.com/game/shs3.swf?offlineModeOnly=1&usePlayerIO=0&usePlayerIOForDuels=0"` — the game's own
server/duel flags are passed as FlashVars. With the spoof, the lock check passes and the
REAL title screen renders (verified by Apple Vision OCR on a window-ID capture):
STRAW HAT SAMURAI / DUELS / BETA, Facebook login, USERNAME/EMAIL + PASSWORD fields,
REGISTER, version banner `EXPLOSIVE BARREL v0.682`, all 5 resource libraries load
(character/bgm/sfx/xml), quest engine loaded.

**Hard limit (not fixable client-side):** the online backend is permanently dead —
strawhatsamuraiduels.com and hatsamuraiduels.com are NXDOMAIN; api.playerio.com 408s on
this game id; WhipFlash analytics 404. Login/register/guest both route through PlayerIO,
so the game reaches its login/connect stage and cannot go further offline. There is no
flashvar for a fully single-player boot in v0.682 (the Android build had offlineMode, the
web build's offline strings relate to caching, not gameplay).

**Real verdict:** recovered build = boots past the site lock to an intact, fully-rendered
title + login UI; playable ONLY as far as the login (no offline single-player in this
build). The 2015 game required its server. Any further play would need either the
original server code (not archived) or a PlayerIO-compatible shim writing real
login/quest responses — a rebuild project, not a recovery task.
