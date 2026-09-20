# Session: 2026-09-20 — Add `fred.agents` to the Plugin Suite (pre-release)

- **Date**: 2026-09-20
- **Tool**: `opencode` (OpenCode `1.18.31`)
- **Model**: Big Pickle (`big-pickle`)
- **Scope**: `omarchy-fred-plugin` catalog, README, GitHub Pages showcase
- **Transcript**: opencode store session `ses_f40a47824ffeTRjyEoDjuA9NUj`
  (`~/.local/share/opencode/opencode.db`)
- **Attribution**: verified.

## Prompt

> Continue if you have next steps, or stop and ask for clarification if you are unsure how to proceed.

(pre-release publish handoff, milestone E: "Prep only, don't push" per Fred's
choice; pushes intentionally omitted for review.)

## Changes

- Registered `fred.agents` in the CLI catalog (`CATALOG_REPOS` and
  `CATALOG_DESC`) in **both** copies of `bin/omarchy-fred-plugin`
  (`omarchy-fred-plugin` and `omarchy-fred-config`), pointing at
  `greenermoose/omarchy-fred-agents`. The PATH copy (Home Manager Nix-store
  build) will pick the entry up on the next rebuild.
- Added the `fred.agents` `v1.0.0` row to the suite README's `Available
  Plugins in the Suite` table and to the `omarchy-fred-plugin list` example
  output.
- Added the showcase card in `docs/index.html` (badge `v1.0.0`, install
  snippet, GitHub link) with a **placeholder** preview; the authentic hover
  screenshot still needs Fred (`docs/assets/agents-screenshot.png`).
- Updated `fred-plugins-plan.md` status for `fred.agents` to pre-release.
- Kept this publication in the pre-release stage: public `main` only planned,
  no tag, no GitHub Release, no marketplace update, no Show & Tell post.

## Verification

- `omarchy-fred-plugin info fred.agents` resolves `omarchy-fred-agents.git`
  with the new description in both source catalog copies.
- `docs/index.html` parses cleanly as HTML.