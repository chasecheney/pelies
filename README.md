# Pelies

A native Plex client for **Apple TV** (tvOS 17+) that also runs on
**macOS** (14+). Forked from PlexPlus and reworked around the Siri
Remote's focus-driven interaction model. No web views — Plex API +
AVPlayer.

## What's different from PlexPlus

- **TV-first player controls**: focusable transport buttons (±10s, ±60s,
  previous/next in queue) with a progress bar — no sliders or touch
  gestures. On the Siri Remote, play/pause toggles playback and the Menu
  button minimizes the player into the mini bar instead of leaving the app.
- **Sign-in without a browser**: the app shows a plex.tv/link code to enter
  on your phone or computer. (On macOS it still opens the link page.)
- **Fixed dark palette** on TV; macOS keeps dynamic system colors.
- **Layered tvOS app icon** with parallax plus Top Shelf images, alongside
  the macOS icon.
- Queue rows are focusable buttons with a long-press menu for removal.
- The Network Log keeps copy/export on macOS; on TV it is view-only.
- Everything else carries over: multi-server browsing, universal search
  (all-libraries scope, sorting, playlist saving), playlists, photo viewer,
  transcode handling and diagnostics.

## Build & run

1. Open `Pelies.xcodeproj` in Xcode 16 or later.
2. Pick a destination:
   - an **Apple TV** simulator or device (tvOS 17+), or
   - **My Mac** (macOS 14+).
3. Choose your team under *Signing & Capabilities*, then run (⌘R).

To install on a physical Apple TV, pair it with Xcode first
(Apple TV: Settings → Remotes and Devices → Remote App and Devices;
Xcode: Window → Devices and Simulators).

## Project layout

The Xcode project uses a file-system-synchronized group: every file in
`Pelies/` compiles automatically.

| File | Role |
| --- | --- |
| `PeliesApp.swift` | App entry point |
| `PlexPlayerView.swift` | Player + browsing UI and view model |
| `PlexAPI.swift` / `PlexModels.swift` | Plex API client + models |
| `PlexCache.swift` | Image + browse caches |
| `PlexPreferences.swift` | Persisted settings |
| `KeychainHelper.swift` | Keychain wrapper |
| `NetworkLog.swift` | Request log (debugging) |
| `PlatformSupport.swift` | Palette + platform helpers |
