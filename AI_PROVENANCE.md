# AI Collaboration & Provenance

This repository, like all components in the `omarchy-fred-*` suite, practices transparent AI-assisted engineering. We openly document the AI tools, models, prompts, and architectural decisions used in pair-programming this software.

---

## 1. Fred's Multi-Agent AI Toolchain

Rather than relying on a single AI model or interface, Fred utilizes a specialized toolchain tailored to each model's strengths:

| Tool & Interface | Backing Models | Primary Role in the Ecosystem |
| :-- | :-- | :-- |
| **Claude Code & Codex** | Claude 3.7 Sonnet, o3-mini | **Architecture & System Planning**: Authoring durable system specifications, multi-step runbooks, and cross-cutting policies. |
| **Antigravity CLI (`agy`)** | Gemini 3.8 Flash (High), Gemini 2.5 Pro | **Coding, Refactoring & Implementation**: Primary coding partner for multi-file pair-programming, security remediation, bash/Python tool engineering, and automated git workflow. |
| **OpenCode** | Open-source / local models | **Distro & System Q&A**: Efficient lookups for Arch Linux / Omarchy package specifics and shell configurations. |
| **Grok** | Frontier reasoning models | **Workstation Support**: Additional debugging, hardware diagnostics, and alternative implementation analysis. |

---

## 2. Provenance Standards Across `omarchy-fred-*`

Every repository in the `omarchy-fred-*` suite implements:
1. **Curated Session Logs**: Chronological prompt and implementation records stored in `docs/ai/sessions.md`.
2. **Git Commit Trailers**:
   ```git
   Co-authored-by: Antigravity <antigravity-bot@users.noreply.github.com>
   AI-Tool: agy
   AI-Model: Gemini 3.8 Flash (High)
   ```
   Commits co-authored by Claude or other agents carry their corresponding GitHub identity trailers.
3. **Open Architecture Plans**: Detailed markdown specifications and security guidelines committed to version control.

---

## 3. Session Log Directory

| Session Date | Topic | Primary Tool | Primary Model | Summary |
| :-- | :-- | :-- | :-- | :-- |
| **2026-09-13** | Ecosystem Scaffolding & CLI Decoupling | `agy` (Antigravity CLI) | Gemini 3.8 Flash (High) | Scaffolding `omarchy-fred-plugin` repo, decoupling CLI from machine-specific Nix paths, implementing marketplace registry queries, and creating public showcase. |

Detailed prompts and decisions are recorded in [`docs/ai/sessions.md`](docs/ai/sessions.md).
