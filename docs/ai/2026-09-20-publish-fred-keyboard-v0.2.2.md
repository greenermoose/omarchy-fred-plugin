# Session: 2026-09-20 — Publish `fred.keyboard` v0.2.2 (pre-release)

- **Date**: 2026-09-20
- **Tool**: `claude` (Claude Code `2.1.278`)
- **Model**: Claude Opus 5 (`claude-opus-5`)
- **Transcript Reference**: `a18febdb-55c9-42f4-87f7-2ae104759b15`
- **Scope**: `omarchy-fred-keyboard` public pre-release, suite README, and
  GitHub Pages showcase
- **Attribution**: verified; versions read live.

## Prompt

Fred, after testing 0.2.2 on his workstation ("Looks great. What's next?"),
approved the recommendation to publish it: *"Make it so"*.

## Changes

- Synced the deployed `fred.keyboard` 0.2.2 into the public repository:
  capture mode (0.1.1, `CaptureMode.qml`), readout fixes (0.1.2), the
  binding overlay (0.2.0, `Bindings.js` parsing `hyprctl binds`), mouse
  capture (0.2.1), and the cross-monitor panel plus collapsible orphan list
  (0.2.2, `ExplorerPanel.qml` cloned from the stock panel under
  `UPSTREAM.md`, `OrphanBinds.qml`). Tests now live beside the source.
- Updated the suite README row and CLI example to 0.2.2.
- Updated the showcase card's badge, lightbox title and description. The
  preview screenshot is unchanged and predates the `Ins` label fix and the
  binding overlay; it needs Fred to open the panel and cannot be taken by an
  agent (the panel takes per-seat keyboard focus).
- Pre-release only: public `main`, no tag, no GitHub Release, no marketplace
  update, no Show & Tell post.

## Verification

- `omarchy plugin validate ~/Code/omarchy-fred-keyboard`: exit 0.
- Four test suites green in the published tree.
- `omarchy-fred-plugin diff fred.keyboard`: only the intended README,
  assets, docs and repo housekeeping differ.
- Both public branches match their remotes after push; no tags at HEAD.

## Follow-up the same day: release v1.0.0

Fred said `Release version 1.0.0 of fred.keyboard`. 0.3.6 (the last of the
day's development versions) was renumbered 1.0.0 with no code change,
tagged (`v1.0.0`, `1.0.0`, `v1.0`, `1.0`), pushed and released on GitHub at
commit `95e43dc7122ea8202adb64d614ede8df976acba5`. Suite README row and
CLI example updated to 1.0.0; the showcase card's badge, lightbox title and
preview image replaced with the real 1.0.0 screenshot (Fred set the panel
up on the MSI monitor, the agent captured it). Show & Tell thread and
marketplace submission follow after Fred's review of each text.
