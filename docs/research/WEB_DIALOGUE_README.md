> **NOTE (2026-09-26, added when copied from `~/sshd1-1-reference`):**
> - The game is **Straw Hat Samurai: Duels, web build** (the same two YouTube longplays as
>   `reference/videos/`), not an unknown title. The pack's videos were 720p copies of those
>   1080p files, so they were left behind, along with `raw/` (0.5 fps dumps, re-derivable).
> - Why this is kept: it is the only copy we have of the **web** build's story wording.
>   `reference/extracted/questdata.xml` is the ANDROID text (identical to
>   `android/116_Mobile_QuestData.bin` bar its trailing newline); the web payload `decrypted/shs3_payload_decoded.swf`
>   holds no quest data at all (0 `<quest`, 0 "jinbei"). Of 347 OCR events, 178 share a
>   4-word phrase with the Android text and 169 do not — part OCR noise, part genuinely
>   rewritten lines (the opening bandit scene is the same scene in different words).
> - `dialogue/dialogue.jsonl` is ONE JSON array, not JSON-lines: read it with `json.load`.
>   Its `img` field points into `raw/shotframes/`, which was not copied; use `png` →
>   `frames/`. The PNG is ground truth; the OCR text is best-effort, and speaker names were
>   never OCR'd.

# SSHD 1-1 Recreation Reference Pack

Source: two full YouTube playthroughs of **Shadow Tactics-like samurai stealth game "Sengoku Samurai Destiny"? — actual title unknown**. Videos:

- `videos/vid1_zFtCaTO0_1M.mp4` — 503 MB, 4185 s (~69.8 min), 1280x720@60
- `videos/vid2_Nr4fQstqHDM.mp4` — 583 MB, 3951 s (~65.8 min), 1280x720@60

## Contents

| Path | What it is | Count |
|---|---|---|
| `dialogue/dialogue.jsonl` | Ordered dialog events: `{seq, video, t_first, t_shot, n_frames, text, text_tight, png, img}` | 347 |
| `frames/dlg_*.png` | Full-quality 1280x720 PNG per dialog event, extracted at t_shot+1s (text fully typed) | 347 |
| `frames/*.jpg` | All event shot frames incl. UI/menus (from 2s dumps) | 657 |
| `raw/dump1, dump2/` | Every frame of both videos at 0.5 fps (2 s interval), JPEG qscale 2 | 2093 + 1975 |
| `raw/scan1.jsonl, scan2.jsonl` | Raw OCR of every dump frame's dialog band (incl. noise rows) | 1418 + 1244 |
| `raw/events_final.json` | The cleaned, deduped dialog event list | 347 |
| `raw/shotframes/`, `raw/shot_manifest.json` | Intermediate shot frames + manifest | 657 |
| `scripts/` | Pipeline: frame dump, OCR scan, filter+merge, extraction | 4 |
| `STORYLINE.md` | The narrative transcript, ordered | — |

## Dialog band coordinates (1280x720)

- Text band: `x 60-1230, y 545-655`
- Full dialog box incl. nameplate: `x 60-1230, y 500-700`
- Nameplate (speaker) sits top-left of box, small text — OCR FAILED on it; read visually.

## Known limitations
1. **Speaker names not OCR'd** — tesseract cannot read the stylized nameplate font. Read them from the PNGs.
2. **2 s sampling** — some dialog lines shorter than 2 s may be missed entirely; long boxes are captured mid-typing (mitigated by t_shot+1s full extract).
3. **OCR noise** — game's serif font produces substitutions ($ for S, | for I). text_tight is the best-effort read; the PNG is ground truth.
4. vid1 has ~251 dialog events, vid2 ~96 — vid2 starts mid-gameplay (vid2 t=0 shows daily-prize popup; player already deep in game).

## Rebuild from scratch
```
ffmpeg -i <video> -vf fps=0.5 -qscale:v 2 dumpN/f%05d.jpg
python3 scripts/scan_ocr.py raw/dumpN raw/scanN.jsonl vidN
python3 scripts/build_dialogue.py raw/dialogue.jsonl raw/dialogue_clean.jsonl  # (see scripts)
# then filter+merge+extract as in scripts/
```
