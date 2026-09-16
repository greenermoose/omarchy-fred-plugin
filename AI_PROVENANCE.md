# AI Collaboration & Provenance

This repository, like all components in the `omarchy-fred-*` suite, practices transparent AI-assisted engineering. We openly document the AI tools, models, prompts, and architectural decisions used in pair-programming this software.

---

## 1. Fred's Multi-Agent AI Toolchain

Rather than relying on a single AI model or interface, Fred uses a specialized toolchain tailored to each tool's strengths. CLI versions below were captured on 2026-09-13 (`<tool> --version`).

| Tool & Interface | CLI Version | Backing Models | Primary Role in the Ecosystem |
| :-- | :-- | :-- | :-- |
| **Claude Code** (`claude`) | `2.1.267` | Claude Opus 5 (`claude-opus-5`) | **Architecture & System Planning**: Authoring durable system specifications, multi-step runbooks, and cross-cutting policies. |
| **Codex CLI** (`codex`) | `0.154.0` | `gpt-6-astra`, `gpt-5.6-sol`, `gpt-5.6-terra` | **Architecture & System Planning**: Second opinion on plans and specifications alongside Claude. |
| **Antigravity CLI** (`agy`) | `1.2.2` / `1.2.3` | Gemini 3.8 Flash (High) | **Coding, Refactoring & Implementation**: Primary coding partner for multi-file pair-programming, security remediation, bash/Python/QML engineering, and git release workflow. |
| **OpenCode** (`opencode`) | `1.18.30` | Big Pickle | **Distro & System Q&A**: Efficient lookups for Arch Linux / Omarchy package specifics and shell configuration, conserving frontier-model token budgets. |
| **Grok CLI** (`grok`) | `1.0.25` (`f7e67d6988e2`, stable) | Grok 4.6 | **Workstation Support**: Additional debugging, hardware diagnostics, and alternative implementation analysis. |

---

## 2. Provenance Standards Across `omarchy-fred-*`

Every repository in the `omarchy-fred-*` suite implements:
1. **Curated Session Logs**: Chronological prompt and implementation records stored in `docs/ai/sessions.md`.
2. **Git Commit Trailers**:
   ```git
   Co-authored-by: Antigravity <antigravity-bot@users.noreply.github.com>
   AI-Tool: agy 1.2.3
   AI-Model: Gemini 3.8 Flash (High)
   ```
   Commits co-authored by Claude or other agents carry their corresponding GitHub identity trailers.
3. **Open Architecture Plans**: Detailed markdown specifications and security guidelines committed to version control.

---

## 3. Session Log Directory

| Session Date | Topic | Primary Tool | Primary Model | Summary |
| :-- | :-- | :-- | :-- | :-- |
| **2026-09-13** | Ecosystem Architecture & Strategy Planning | `agy` (Antigravity CLI `1.2.2`) | Gemini 3.8 Flash (High) | Authored the 5-point ecosystem architecture plan covering CLI decoupling, marketplace status tracking, AI provenance, and public showcase. |
| **2026-09-13** | CLI Decoupling, Scaffolding & Initial Release (v1.0.0) | `agy` (Antigravity CLI `1.2.2`) | Gemini 3.8 Flash (High) | Scaffolding `omarchy-fred-plugin` repo, decoupling CLI from machine-specific Nix paths, implementing marketplace registry queries, and creating public showcase. |
| **2026-09-16** | Showcase Website Enhancements & Marketplace Alignment | `agy` (Antigravity CLI `1.2.4`) | Gemini 3.8 Flash (High) | Updated GitHub showcase site with marketplace links, verified badges, interactive copy buttons, dev mode documentation, and expanded AI model attributions. |

Detailed prompts and decisions are recorded in [`docs/ai/sessions.md`](docs/ai/sessions.md).
