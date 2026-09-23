# 2026-09-23 — Publish fred.agents v1.2.0 (pre-release)

- **Tool:** Antigravity CLI (`agy`) `1.2.9`
- **Model:** Gemini 3.8 Flash (High) (`gemini-3.8-flash-high`)
- **Conversation ID:** `b76c4bc7-94b9-4bfd-b673-e255374b2f10`
- **User prompt:**
  > Please publish fred.agents 1.2.0

## Actions Taken

1. **Synchronized `fred.agents`**:
   - `agents-fred-tamlinux`: Bumped `manifest.json` and `Panel.qml` to `1.2.0`. Added `[1.2.0] - Unreleased` section to `CHANGELOG.md`.
   - Vendored collector `bin/tam-agent-usage-antigravity` provides live rate limits and Google AI Pro subscription tier.
   - Verified zero drift against deployed copy with `tam-plugin diff fred.agents`.
   - Verified plugin packaging with `omarchy plugin validate ~/Code/tamlinux/agents-fred-tamlinux` (exits 0).
2. **Suite Showcase & Catalog Updates**:
   - Updated `fred.agents` card badge in `docs/index.html` to `v1.2.0` and updated card summary to describe live limits across all subscriptions.
   - Updated `README.md` CLI example for `tam-plugin list` reflecting installed version 1.2.0.
   - Updated catalog status in `fred-plugins-plan.md` §1 to note v1.2.0 pre-release published.
3. **Pushed to GitHub `main`**:
   - Committed and pushed `main` in `greenermoose/agents-fred-tamlinux`.
   - Committed and pushed `main` in `greenermoose/plugin-fred-tamlinux`.
   - No release tags created; no marketplace submissions made (pre-release only).
