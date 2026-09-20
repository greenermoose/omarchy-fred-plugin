# Session: 2026-09-19 — Add `fred.keyboard` to Fred's Omarchy Plugin Suite

- **Date**: 2026-09-19
- **Tool**: `claude` (Claude Code `2.1.278`)
- **Model**: `claude-opus-5` (Claude Opus 5)
- **Scope**: `omarchy-fred-plugin` (CLI catalog, README table, showcase website), `omarchy-fred-keyboard` (new repository), `omarchy-fred-config` (deployment, suite plan)

## Summary of Changes

1. **New plugin repository**: created `greenermoose/omarchy-fred-keyboard`
   (public) at `v0.1.0`, pre-release. Not tagged and not released.

2. **CLI Catalog Registration**:
   - Added `fred.keyboard` to `CATALOG_REPOS` mapping to
     `https://github.com/greenermoose/omarchy-fred-keyboard.git`.
   - Added `fred.keyboard` to `CATALOG_DESC`.
   - Applied to both catalog copies (`omarchy-fred-plugin/bin/` and
     `omarchy-fred-config/bin/`), which must stay identical.

3. **README Documentation**: added the `fred.keyboard` row to the
   `Available Plugins in the Suite` table (`v0.1.0`,
   `Available (In testing)`) and to the example `list` output.

4. **Showcase Website**: added a card with the `v0.1.0` badge, screenshot
   preview, summary, install snippet, and repository link.

5. **Suite plan**: added the plugin row and plan index entry in
   `fred-plugins-plan.md`.

## Design decisions worth recording

- **Not a keylogger, by construction.** Fred's original framing was that a
  keyboard inspector is unavoidably a keylogger. It is not: key capture is
  panel-scoped, reading keys through QML handlers only while the plugin's own
  panel holds keyboard focus. The compositor routes keystrokes solely to the
  focused surface, so nothing typed elsewhere is ever visible. No
  `/dev/input`, no `input` group, no background process. The tradeoff Fred
  accepted is that live highlighting only works while the panel is focused.

- **Compositor interception, and the way out.** Hyprland matches keybinds
  before the focused client sees the key, so a panel-scoped listener would
  never receive `Super+K`. The
  `zwp_keyboard_shortcuts_inhibit_manager_v1` protocol suspends that
  matching; it was verified end to end (Hyprland `ShortcutsInhibit.cpp`,
  `KeybindManager.cpp:643`/`:844`, layer-shell support, Quickshell's
  `ShortcutInhibitor`, `binds:disable_keybind_grabbing=false`, 0 of 252 binds
  exempt). Capture mode is the next milestone.

- **Two supplies of keyboard layouts.** The OS XKB geometries
  (`pc101`/`pc104`/`pc105`, vendor files) plus a field-observed library in
  `layouts/*.json` for boards no stock geometry describes. A device's HID
  descriptor advertises the generic usage table, not its keycaps: Fred's
  Calliope declares 180 keys including `F13`-`F24` and Japanese IME keys it
  does not have, declares `RIGHTMETA` though it has no right Super, and omits
  `FN` entirely because that key is firmware-local. Declared is not present,
  and present is not always declared, so only a human transcription settles
  it.

- **Lock LEDs from sysfs.** Caps/Num Lock state comes from
  `/sys/class/leds/input<N>::capslock/brightness` - the real hardware lamp,
  needing no privileges and observing no keystrokes. The node is derived from
  the device's own event index rather than guessed.

## Provenance note

Initial reconnaissance was done by `agy` (Antigravity CLI `1.2.7`, Gemini 3.8
Flash High) in session `3eb22acb-1ed1-46e1-a06e-efd56bd84846`, which surveyed
Omarchy internals and the marketplace registry but wrote no code before
stopping on an API quota limit. All code in this session was written by Claude
Code.
