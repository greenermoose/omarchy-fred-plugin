# AI Collaboration & Provenance

This repository, like all components in the `omarchy-fred-*` suite, practices transparent AI-assisted engineering. We openly document the AI tools, models, prompts, and architectural decisions used in pair-programming this software.

---

## 1. Fred's Multi-Agent AI Toolchain

Rather than relying on a single AI model or interface, Fred uses a specialized toolchain tailored to each tool's strengths. CLI versions below were captured on 2026-09-13 (`<tool> --version`).

| Tool & Interface | CLI Version | Backing Models | Primary Role in the Ecosystem |
| :-- | :-- | :-- | :-- |
| **Claude Code** (`claude`) | `2.1.267` | Claude Opus 5 (`claude-opus-5`) | **Architecture & System Planning**: Authoring durable system specifications, multi-step runbooks, and cross-cutting policies. |
| **Codex CLI** (`codex`) | `0.154.0` | `gpt-6-astra`, `gpt-5.6-sol`, `gpt-5.6-terra` | **Architecture & System Planning**: Second opinion on plans and specifications alongside Claude. |
| **Antigravity CLI** (`agy`) | `1.2.2` – `1.2.6` | Gemini 3.8 Flash (High) | **Coding, Refactoring & Implementation**: Primary coding partner for multi-file pair-programming, security remediation, bash/Python/QML engineering, and git release workflow. |
| **OpenCode** (`opencode`) | `1.18.30` | Big Pickle | **Distro & System Q&A**: Efficient lookups for Arch Linux / Omarchy package specifics and shell configuration, conserving frontier-model token budgets. |
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

Detailed prompts and decisions are recorded in individual session logs under [`docs/ai/`](docs/ai/).
