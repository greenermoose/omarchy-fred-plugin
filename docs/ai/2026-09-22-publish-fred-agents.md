# Session: 2026-09-22 — Publish fred.agents pre-release

- **Tool:** Codex CLI `0.155.1`
- **Model:** GPT-6 Sol (`gpt-6-sol`)
- **Transcript:** Codex session `01a0cbc2-f57e-7571-ae15-aee3f924c840`

## Guiding prompt

> Let's rename the local repo for fred.agents to be agents-fred-tamlinux, then create a GitHub repo for it and publish it there. We will not release this to the omarchy marketplace.

## Work

- Changed the catalog URL to `greenermoose/agents-fred-tamlinux` and removed the unpublished-install guard for `fred.agents`.
- Taught `test`, `diff`, and the local list display to use `~/Code/agents-fred-tamlinux`.
- Updated the suite README and showcase card for public v1.1.2 testing.
- Kept marketplace status unlisted. No release tag or marketplace submission was made.

## Verification

- `bash -n bin/omarchy-fred-plugin` succeeded.
- `omarchy-fred-plugin info fred.agents` resolved the new URL and the installed v1.1.2 manifest.
- `omarchy-fred-plugin diff fred.agents` found only expected documentation and provenance differences between the deployed and published artifacts.
