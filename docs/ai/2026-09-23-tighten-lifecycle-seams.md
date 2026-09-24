# Session: 2026-09-23 — Tighten Plugin Lifecycle Seams (v1.2.0)

- **CLI Tool**: Antigravity CLI (`agy`) `1.2.9`
- **Model**: `gemini-3.8-flash-high`
- **Conversation ID**: `575f2740-9300-4e77-833a-f2dbc154a031`
- **Prompts**:
  > Read the plan at ~/Code/tamlinux/config-fred-tamlinux/agent/docs/plans/plugin-lifecycle-seams-plan.md. Do you understand it? Ask if you have any questions or ideas about how to improve this plan.
  >
  > 1 formalize that screenshots live under assets/screenshots
  > 2 tam-plugin run should also update the plugin version in bom.json
  > 3 provide a dedicated tam-plugin restore <id> command to restore the managed state due to an active override or stale state
  >
  > Do these answer all your questions?
  >
  > Also, I approve the proposed Run record. I also approve the rule that behavior-bearing differences return the candidate to Test. I need to test if any changes snuck in.
  >
  > Begin implementation now.

## Summary of Changes

1. **Seam 1 (Activation Safety & State Preservation):**
   - Implemented private recovery state preservation in `tam-plugin dev on` (`~/.local/state/tam-plugin/dev/<id>/original`).
   - Implemented dedicated `tam-plugin restore <id>` to reconcile active dev/test symlinks and restore saved state.
   - Added `checkPluginOverrides` activation hook in `home.nix` ordered before `checkLinkTargets` to reject switches while overrides are active.

2. **Seam 3 (Exact, Reproducible Snapshots):**
   - Implemented Git-aware snapshot creation (`git ls-files` + untracked non-ignored files) preventing `.gitignore`d caches (`__pycache__`, `*.pyc`) from entering snapshots.
   - Implemented deterministic canonical payload manifest generation and SHA-256 digest computation (`.payload.manifest`, `.payload.digest`).
   - Added snapshot payload integrity verification in `tam-plugin test status`.

3. **Seam 2 (Cross-Stage Verification & Tracking):**
   - Added `--source deployed|published` support to `tam-plugin test`.
   - Formalized `assets/screenshots/` (and root `preview.png`) as distribution-only exclusions alongside documentation and tests.
   - Implemented `tam-plugin verify <id>` to compare payload manifests and fail with non-zero exit on behavior-bearing drift between candidates.
   - Implemented `tam-plugin run <id>` to transition candidates to Run mode (verify test snapshot digest match, switch Home Manager, record `system/plugin-runs/<id>.json`, and update `system/bom.json`).
   - Bumped `tam-plugin` to `v1.2.0`.
   - Added full regression test harness `tests/test-lifecycle-seams.sh`.
