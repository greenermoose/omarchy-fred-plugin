# AI Collaboration & Provenance

This repository, like all components in the `omarchy-fred-*` suite, practices transparent AI-assisted engineering. We openly document the AI tools, models, prompts, and architectural decisions used in pair-programming this software.

---

## 1. Fred's Multi-Agent AI Toolchain

Rather than relying on a single AI model or interface, Fred uses a specialized toolchain tailored to each tool's strengths. CLI versions below were captured on 2026-09-22 (`<tool> --version`).

| Tool & Interface | CLI Version | Backing Models | Primary Role in the Ecosystem |
| :-- | :-- | :-- | :-- |
| **Claude Code** (`claude`) | `2.1.278` | Claude Opus 5 (`claude-opus-5`) | **Architecture & System Planning**: Authoring durable system specifications, multi-step runbooks, and cross-cutting policies. |
| **Codex CLI** (`codex`) | `0.155.1` | `gpt-6-astra`, `gpt-6-sol`, `gpt-5.6-sol`, `gpt-5.6-terra` | **Architecture & System Planning**: Second opinion on plans and specifications alongside Claude. |
| **Antigravity CLI** (`agy`) | `1.2.2` – `1.2.8` | Gemini 3.8 Flash (High) | **Coding, Refactoring & Implementation**: Primary coding partner for multi-file pair-programming, security remediation, bash/Python/QML engineering, and git release workflow. |
| **OpenCode** (`opencode`) | `1.18.31` | Big Pickle | **Distro & System Q&A**: Efficient lookups for Arch Linux / Omarchy package specifics and shell configuration, conserving frontier-model token budgets. |
| **Grok CLI** (`grok`) | `1.0.25` (`f7e67d6988e2`, stable) | Grok 4.6 | **Workstation Support**: Additional debugging, hardware diagnostics, and alternative implementation analysis. |

---

## 2. Provenance Standards Across `omarchy-fred-*`

Every repository in the `omarchy-fred-*` suite implements:
1. **Curated Session Logs**: Chronological prompt and implementation records stored as individual per-session documents in [`docs/ai/`](docs/ai/).
2. **Git Commit Trailers**:
   ```git
   Co-authored-by: Antigravity <antigravity-bot@users.noreply.github.com>
   AI-Tool: agy 1.2.6
   AI-Model: Gemini 3.8 Flash (High)
   ```
   Commits co-authored by Claude or other agents carry their corresponding GitHub identity trailers.
3. **Open Architecture Plans**: Detailed markdown specifications and security guidelines committed to version control.

---

## 3. Session Log Directory

The [2026-09-22 repository rename session](docs/ai/2026-09-22-github-repository-renames.md) records the URL and showcase changes made with Codex CLI `0.155.1` (`gpt-6-sol`).

| Session Date | Topic | Primary Tool | Primary Model | Summary |
| :-- | :-- | :-- | :-- | :-- |
| [**2026-09-13**](docs/ai/2026-09-13-ecosystem-architecture-and-strategy-planning.md) | Ecosystem Architecture & Strategy Planning | `agy` (Antigravity CLI `1.2.2`) | Gemini 3.8 Flash (High) | Authored the 5-point ecosystem architecture plan covering CLI decoupling, marketplace status tracking, AI provenance, and public showcase. |
| [**2026-09-13**](docs/ai/2026-09-13-scaffolding-cli-decoupling-v1.0.0.md) | CLI Decoupling, Scaffolding & Initial Release (v1.0.0) | `agy` (Antigravity CLI `1.2.2`) | Gemini 3.8 Flash (High) | Scaffolding `omarchy-fred-plugin` repo, decoupling CLI from machine-specific Nix paths, implementing marketplace registry queries, and creating public showcase. |
| [**2026-09-16**](docs/ai/2026-09-16-showcase-website-enhancements.md) | Showcase Website Enhancements & Marketplace Alignment | `agy` (Antigravity CLI `1.2.4`) | Gemini 3.8 Flash (High) | Updated GitHub showcase site with marketplace links, verified badges, interactive copy buttons, dev mode documentation, and expanded AI model attributions. |
| [**2026-09-16**](docs/ai/2026-09-16-omarchy-community-showcase-announcement.md) | Omarchy Community Showcase Announcement | `agy` (Antigravity CLI `1.2.4`) | Gemini 3.8 Flash (High) | Authored and published Omarchy discussion #12122 announcing the Fred's Omarchy Plugins showcase website. |
| [**2026-09-18**](docs/ai/2026-09-18-showcase-screenshots-and-readme-feature.md) | Showcase Website Screenshots & Prominent README Feature | `agy` (Antigravity CLI `1.2.6`) | Gemini 3.8 Flash (High) | Featured showcase website prominently above property table in README, updated all plugin versions/statuses across README and showcase, and added screenshot previews with interactive lightbox modal. |
| [**2026-09-18**](docs/ai/2026-09-18-showcase-tagline-energy-efficiency.md) | Showcase Tagline: Energy Efficiency & AI Best Practices | `agy` (Antigravity CLI `1.2.6`) | Gemini 3.8 Flash (High) | Updated hero tagline on showcase website to highlight environmental sustainability, energy efficiency, and AI pair programming best practices. |
| [**2026-09-18**](docs/ai/2026-09-18-readme-update-and-multi-file-session-migration.md) | README Restructuring & Multi-File AI Session Migration | `agy` (Antigravity CLI `1.2.6`) | Gemini 3.8 Flash (High) | Restructured README headers, showcase callout, Authors attribution, and plugin suite table; migrated `docs/ai/` session archive to per-session markdown files. |
| [**2026-09-18**](docs/ai/2026-09-18-showcase-all-screenshots-and-repo-links.md) | Showcase Screenshots for All Plugins & Repository Navigation | `agy` (Antigravity CLI `1.2.6`) | Gemini 3.8 Flash (High) | Added top-line GitHub repo link, updated all plugin versions (workspaces v1.5.1, clock v1.3.3, sysinfo v1.1.1, weather v1.0.3, monitor v1.0.0), embedded screenshots for all plugins (including weather and monitor), and linked fred.monitor repo. |
| [**2026-09-19**](docs/ai/2026-09-19-add-fred-tides-to-plugin-suite.md) | Add fred.tides to Fred's Omarchy Plugin Suite | `agy` (Antigravity CLI `1.2.6`) | Gemini 3.8 Flash (High) | Registered `fred.tides` in CLI catalog (`CATALOG_REPOS` and `CATALOG_DESC`), added to README suite table and CLI example, and added showcase card with screenshot in GitHub Pages site. |
| [**2026-09-19**](docs/ai/2026-09-19-release-fred-tides-v1.0.3.md) | Release fred.tides v1.0.3 & Marketplace Verification | `agy` (Antigravity CLI `1.2.6`) | Gemini 3.8 Flash (High) | Released `fred.tides` v1.0.3, opened Show & Tell discussion #12528, submitted marketplace issue #7664 (passed baseline), synced workstation BOM, and updated suite catalog and showcase site. |
| [**2026-09-19**](docs/ai/2026-09-19-showcase-layout-and-navigation-improvements.md) | Showcase Layout & Navigation Improvements | `agy` (Antigravity CLI `1.2.6`) | Gemini 3.8 Flash (High) | Reordered showcase flow (Standardization Strategy below plugin cards), removed Plugin Catalog heading for direct hero-to-cards view, enabled full-width curl display without scroll, added top-line v1.0.1 badge, and linked ecosystem chip. |
| [**2026-09-19**](docs/ai/2026-09-19-showcase-motivation-and-values-refinement.md) | Showcase Motivation & Values Refinement | `agy` (Antigravity CLI `1.2.6`) | Gemini 3.8 Flash (High) | Replaced Standardization Strategy with Motivation & Values section reflecting hardware longevity, AI introspection/repair, fleet standardization, and community hacker gatherings. |

| [**2026-09-19**](docs/ai/2026-09-19-add-fred-keyboard-to-plugin-suite.md) | Add fred.keyboard to Fred's Omarchy Plugin Suite | `claude` (Claude Code `2.1.278`) | Claude Opus 5 (`claude-opus-5`) | Created the public `omarchy-fred-keyboard` repository at v0.1.0 (pre-release, untagged), registered it in both CLI catalog copies, added the README suite row and CLI example, and added the showcase card. |
| [**2026-09-20**](docs/ai/2026-09-20-publish-fred-sysinfo-v1.1.2-hover.md) | Publish fred.sysinfo v1.1.2 Resource Hover | `codex` (Codex CLI `0.155.1`) | GPT-5.6 Sol (`gpt-5.6-sol`) | Updated the suite catalog and GitHub Pages showcase to v1.1.2, replacing the sysinfo preview with an authentic MSI screenshot of the fresh CPU/RAM/disk hover. |
| [**2026-09-20**](docs/ai/2026-09-20-publish-fred-keyboard-v0.2.2.md) | Publish fred.keyboard v0.2.2 (pre-release) | `claude` (Claude Code `2.1.278`) | Claude Opus 5 (`claude-opus-5`) | Synced 0.2.2 (capture mode, binding overlay from `hyprctl binds`, mouse capture, cross-monitor panel, orphan list) to the public repo; updated the suite README row, CLI example and showcase card badge/description. Screenshot refresh pending Fred. Same day: released v1.0.0 (tag, GitHub Release at `95e43dc7`), suite row and showcase updated with the real screenshot. |
| [**2026-09-20**](docs/ai/2026-09-20-add-fred-agents-to-suite.md) | Add fred.agents to the suite (pre-release prep) | `opencode` (OpenCode `1.18.31`) | Big Pickle (`big-pickle`) | Registered `fred.agents` v1.0.0 in both CLI catalog copies (`omarchy-fred-agents.git`), added the README suite row and example output, and added the showcase card with a placeholder preview. Push pending Fred. |
| [**2026-09-22**](docs/ai/2026-09-22-snapshot-testing-and-human-authorship.md) | Immutable Plugin Test Snapshots & Human Authorship | `codex` (Codex CLI `0.155.1`) | GPT-5.6 Sol (`gpt-5.6-sol`) | Added working-tree/Git-ref snapshot deployment with undo and exact restoration; taught provenance and publish guidance to preserve human-only code authorship while separately disclosing later AI assistance. |
| [**2026-09-22**](docs/ai/2026-09-22-plugin-status-audit-and-doc-corrections.md) | Plugin Status Audit & Documentation Corrections | `claude` (Claude Code `2.1.278`) | Claude Opus 5 (`claude-opus-5`) | Audited all eight `fred.*` plugins against manifests, tags, releases, and the live marketplace registry; corrected stale versions and marketplace status across the suite catalog, README, and showcase; marked the unpublished `fred.agents` as Coming soon and guarded `install` against it; removed `fred.launch` from the plugin catalog as it is a menu route, not a plugin. |
| [**2026-09-22**](docs/ai/2026-09-22-publish-fred-agents.md) | Publish fred.agents v1.1.2 pre-release | `codex` (Codex CLI `0.155.1`) | GPT-6 Sol (`gpt-6-sol`) | Renamed the public repository to `agents-fred-tamlinux`, enabled catalog installation, updated local checkout routing and the showcase card, and published `main` without a release or marketplace submission. |

Detailed prompts and decisions are recorded in individual session logs under [`docs/ai/`](docs/ai/).
