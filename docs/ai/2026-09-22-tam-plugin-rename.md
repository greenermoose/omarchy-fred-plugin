# Session: 2026-09-22 — Rename CLI to tam-plugin and look under ~/Code/tamlinux

- **CLI Tool**: Cursor `3.21.16`
- **Model**: `composer`
- **Commit**: `eca1e40` (CLI rename) plus this provenance follow-up
- **Transcript Reference**: `68f9fa04-2323-4102-841a-25ab29a68985`

## Prompts

> I want to do a big rename project for my code. When I'm done, this is what I want to have accomplished: 1) fred.tides and fred.sysinfo will be in normal mode, not test. I have tested them and they are ready to be published to GitHub and used as regular plugins on my system.

Fred later chose daily `tam-*` command names, optional long aliases matching the public repo names, and local clones under `~/Code/tamlinux/<thing>-fred-tamlinux`.

## Key Decisions & Implementation Notes

- Daily command is `tam-plugin`; long alias is `plugin-fred-tamlinux`.
- Defaults: `REPO_DIR=~/Code/tamlinux/config-fred-tamlinux`, `PUBLISHED_ROOT=~/Code/tamlinux`.
- `published_dir()` is `$PUBLISHED_ROOT/${id#fred.}-fred-tamlinux` (no `fred.agents` special case).
- State/cache: `${XDG_STATE_HOME:-~/.local/state}/tam-plugin` and `~/.cache/tam-plugin`.
- `fred-plugin-upstream-diff` folded into `tam-plugin upstream-diff`.

## Verification

- Live Home Manager generation 93 serves the new binaries.
- `command -v tam-plugin` succeeds; `omarchy-fred-plugin` is gone.
