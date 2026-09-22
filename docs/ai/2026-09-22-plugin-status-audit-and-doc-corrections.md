# Session: 2026-09-22 — Plugin Status Audit and Documentation Corrections (v1.1.1)

- **CLI Tool**: `claude` (Claude Code `2.1.278`)
- **Model**: Claude Opus 5 (`claude-opus-5`)
- **Session**: `1f48910e-13d3-45da-a0eb-a93fddd4ba97`
- **Implementation Commit**: recorded on push

## Prompts

> In writing some improvements for the repo in ~/Code/omarchy-fred-improvements, we noticed that the docs for this system are incomplete and incorrect. Please evaluate the status of all fred.* plugins, check for documentation about them that is incorrect or misleading, and correct. Ask if you have questions.

Fred then chose, in answer to three questions: keep `fred.agents` in the catalog
but mark it "Coming soon"; move `fred.launch` out of the plugin catalog
entirely; and correct every surface, committing and pushing the result.

## Audit Method

Status was derived from primary sources rather than from any existing document:
each plugin's `manifest.json` (deployed and published), `git tag` and
`gh release list` per repository, `gh repo view` for repository existence, the
live marketplace `registry.json`, and the open/closed state of each
`omacom/omarchy-plugin-marketplace` submission issue.

## Findings

- `fred.agents` is deployed at 1.1.2 but `greenermoose/omarchy-fred-agents`
  does not exist. The CLI catalog, README, and showcase all advertised an
  install command pointing at a 404.
- `fred.launch` is not a plugin. Only Phase 1 shipped, as an
  `omarchy-menu.jsonc` tree plus a `bindings.lua` rebind; no plugin directory,
  manifest, catalog entry, or repository exists. It was nevertheless listed in
  the suite catalog and in `AGENTS.md`'s plugin-set line.
- `fred.keyboard` was listed on the marketplace with a passing security
  baseline on 2026-09-21 (#7860 closed); docs still said "submission pending".
- Suite catalog versions were stale throughout: `fred.workspaces` recorded as
  v1.3.0 (actually v1.5.1), `fred.clock` v1.3.0 "in review" (v1.3.3, listed
  2026-09-16), `fred.weather` v1.0.0 (1.0.4 deployed), `fred.monitor` v1.2.1
  (1.2.3 deployed), and the manager CLI as "plan drafted" (published v1.1.0).
- The `fred.monitor` plan carried a duplicated, contradictory C8/C9 pair and a
  dev-override guard that no longer applied; no dev symlinks remain under
  `~/.config/omarchy/plugins/`.

## Decisions and Implementation

- Added `CATALOG_UNPUBLISHED` to `bin/omarchy-fred-plugin`. Unpublished catalog
  entries stay discoverable in `list` and `search` but report "Coming soon" /
  "unpublished" and are refused by `install` with an explanatory message,
  instead of failing against a non-existent repository.
- Rewrote the README suite table around released versions and real marketplace
  state, and corrected the illustrative `list` output.
- Showcase: `fred.agents` became a non-clickable "Coming soon" card with its
  404 repository link and install command replaced by an explanatory note;
  `fred.keyboard` gained a Verified badge and a marketplace link; `fred.sysinfo`
  and `fred.weather` badges were moved to their latest releases; the CLI badge
  was corrected to v1.1.1.
- Bumped the CLI to 1.1.1 (`VERSION` and README) for the behavioral change.

## Verification

- `bash -n bin/omarchy-fred-plugin` passed.
- `omarchy-fred-plugin list --all`, `search agents`, and `install fred.agents`
  were run live; the guard, the "Coming soon" marketplace column, and the
  "unpublished" release column all behaved as intended.
- Every status claim written into the docs was re-read back from the primary
  source it came from.
