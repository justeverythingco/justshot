# JustShot Integrations

Automate [JustShot](https://justshot.net) from **Raycast**, **Alfred**, **Apple Shortcuts**, or any
script, using its `justshot://` URL scheme. Capture, record, pin, and upload — hands-free.

> Requires JustShot for macOS. Enable **Settings → Advanced → "Allow control via justshot:// URLs"**
> (on by default).

## Quick start

Any way of opening a `justshot://…` URL triggers JustShot. The simplest test, in Terminal:

```bash
open "justshot://capture-area?action=copy"
```

That starts an area capture and copies the result to your clipboard. Everything below is built on that.

## Commands

| URL | What it does |
|---|---|
| `justshot://capture-area` | Area capture (drag to select). |
| `justshot://capture-fullscreen` | Full-screen capture. |
| `justshot://capture-window` | Window capture (click a window). |
| `justshot://capture-scrolling` | Scrolling capture — auto-scrolls a region into one tall image. *(needs Accessibility)* |
| `justshot://capture-text` | OCR a region (and decode QR/barcodes), copied to the clipboard. |
| `justshot://record` | Start a recording. `?source=area\|fullscreen\|window`, or omit to open the recorder bar. *(needs Screen Recording)* |
| `justshot://open-from-clipboard` | Open the clipboard image in the editor. |
| `justshot://pin?path=<file>` | Pin an image file to the screen. |
| `justshot://open?path=<file>` | Open an image file in the editor. |
| `justshot://upload?path=<file>` | Upload an image file and copy the share link. |
| `justshot://open-settings` | Open Settings (`?tab=general\|hotkeys\|cloud\|advanced`). |

### Parameters

- **`action`** (on the four capture commands) — override what happens after the capture:
  `copy` · `save` · `annotate` · `pin` · `upload`. Omit to use your "After a capture" setting.
- **`source`** (on `record`) — `area` · `fullscreen` · `window`. Omit to open the recorder bar.
- **`path`** (on `pin` / `open` / `upload`) — an absolute path or `~/…`; URL-encode spaces.
- **`tab`** (on `open-settings`) — `general` · `hotkeys` · `cloud` · `advanced`.

```
justshot://capture-scrolling?action=upload
justshot://record?source=area
justshot://upload?path=~/Desktop/shot.png
```

## Raycast

Ready-made [Script Commands](https://github.com/raycast/script-commands) are in [`raycast/`](raycast):

| Script | Runs |
|---|---|
| `capture-area.sh` | `capture-area?action=copy` |
| `capture-scrolling.sh` | `capture-scrolling?action=upload` |
| `record-area.sh` | `record?source=area` |
| `upload-image.sh` | `upload?path=…` (prompts for a file; expands `~`, URL-encodes) |

**Install:** `chmod +x raycast/*.sh`, then Raycast → **Settings → Extensions → Script Commands → Add
Script Directory** → pick `raycast/`. Edit the `?action=` / `?source=` in any script to taste.

## Apple Shortcuts

Each is a one-step Shortcut using the **"Open URLs"** action:

| Shortcut | URL |
|---|---|
| Capture area → copy | `justshot://capture-area?action=copy` |
| Scrolling capture → upload | `justshot://capture-scrolling?action=upload` |
| Record full screen | `justshot://record?source=fullscreen` |
| Open the recorder | `justshot://record` |

**Upload a file and reuse the link:** *Receive Files* → *URL Encode* the path → *Text*
`justshot://upload?path=` + encoded → *Open URLs* → *Get Clipboard* (JustShot copies the `jstsht.co`
link). Works as a Finder Quick Action.

## Alfred

A Workflow with a **Run Script** (`/bin/bash`) or **Open URL** action:

```bash
open "justshot://capture-fullscreen?action=annotate"
```

Or a **File Action** passing the selection to `justshot://upload?path={query}` (URL-encode `{query}`).

## Contributing

PRs welcome — share your Raycast scripts, Shortcuts, or Alfred workflows for JustShot.

## License

[MIT](LICENSE). JustShot itself is a separate app; this repo is community integration samples and docs.
