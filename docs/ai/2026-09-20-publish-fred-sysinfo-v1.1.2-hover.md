# Session: 2026-09-20 — Publish `fred.sysinfo` v1.1.2 Resource Hover

- **Date**: 2026-09-20
- **Tool**: `codex` (Codex CLI `0.155.1`)
- **Model**: GPT-5.6 Sol (`gpt-5.6-sol`)
- **Transcript Reference**: `01a0be6a-6329-77b2-9413-b4cd5b7e7971`
- **Scope**: `omarchy-fred-sysinfo` public pre-release, suite README, and GitHub Pages showcase

## Prompt

> "Use the msi monitor to take screenshots of fred.sysinfo so you can update the hover view shown in out public GitHub repos. Make sure to push to both omarchy-fred-sysinfo and omarchy-fred-plugin (especially our plugin showcase HTML page). Ask if you have questions about how or why to do this."

## Changes

- Synced the deployed `fred.sysinfo` 1.1.2 resource-summary hover to the public plugin repository.
- Captured the live hover and full telemetry panel on the MSI MP161 (`DP-2`). The tightly cropped images show the running 1.1.2 build while excluding unrelated desktop content.
- Updated the suite README to list 1.1.2 as `Available (In testing)`.
- Replaced the GitHub Pages card preview with the new hover screenshot and updated its badge, lightbox title, alternative text, and description.
- Kept this publication in the pre-release stage: public `main` only, with no tag, GitHub Release, marketplace update, or Show & Tell post.

## Verification

- Validated the public plugin with `omarchy plugin validate`.
- Checked the static showcase markup and image references.
- Confirmed both public repository branches match their remotes after push.
