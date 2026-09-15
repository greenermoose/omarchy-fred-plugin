# AI Collaboration Session Archive: `omarchy-fred-plugin`

This log documents prompt history, tools, models, and key architectural decisions for `omarchy-fred-plugin`.

---

## Session: 2026-09-13 — Ecosystem Architecture & Strategy Planning

- **Date**: 2026-09-13
- **Primary AI Agent**: Antigravity (Google DeepMind) via Antigravity CLI (`agy 1.2.2`)
- **AI Model**: Gemini 3.8 Flash (High) (`gemini-3.8-flash-high`)
- **Transcript Reference**: `b6898052-e347-438a-8d54-a7cefb7cffd0`
- **Participants**: Fred (@greenermoose), Antigravity

### Guiding Prompts
> **Fred:**
> "Create a plan for the following project, then let me review before we proceed:
>
> 1) Create a public GitHub repo for omarchy-fred-plugin.
> 2) Clean up my omarchy-fred-plugin code so it can be pushed to that GitHub repo and be useful to people who are using the fred.* suite of plugins for omarchy.
> 3) In all of the omarchy-fred-* GitHub repos, begin keeping track of the following: a) the command line tool and specific version of the tool (e.g. agy) and the model (e.g. Gemini 3.8 Flash) used to develop the code, and b) the prompts used to develop the code. The goal of this is to help other developers understand how to use AI tools to produce similar code artifacts.
> 4) Create a system for installing and managing fred.* plugins for omarchy systems. Make it possible for a user to discover all the fred.* plugins available, see what versions (if any) they have installed on their current system, and what versions are available on the omarchy plugin marketplace. We'll use the marketplace's review process as a way to ensure the plugins we release meet the omarchy standards.
> 5) Create a web page on GitHub that explains the omarchy fred plugin ecosystem. These are all Fred's omarchy plugins, which are enhancements to omarchy that Fred (using AI) has created to make omarchy work better for him. The goal of putting these all together is so that Fred can provision additional hardware with omarchy and have it work the way he wants. Fred is using omarchy as a way to maximize the performance of his computing resources, which includes many different types of computers that have run many different typs of OSes in the past. He's standardizing on omarchy so that he has a consistent development platform and environment that works on all of the computers he has, so that he doesn't have to worry about patching and keeping a bunch of random OSes going on all these different types of computers.
>
> Ask if you have any questions about this project and the plan you are being asked to create."
>
> "Is this plan available to future sessions? It looks good but I need to end this conversation. Can I safely end this conversation without losing this plan? Also, note that I use claude, codex, grok and opencode as well, not just agy on my omarchy system. I generally use claude and codex to generate plans, but occasionally I use agy for that. I tend to use agy for coding because it is fast, works well, and has generous token limits. I tend to use opencode for questions about omarchy because it is free and good enough for answering questions like that, which conserves tokens for coding tasks from other AI models."

### Architectural Decisions
1. **Defined 6-Phase Ecosystem Roadmap**: Authored [`docs/plans/omarchy-fred-plugin-ecosystem-plan.md`](file:///home/fred/docs/plans/omarchy-fred-plugin-ecosystem-plan.md) covering project scaffolding, CLI refactoring, transparent AI provenance standards, marketplace registry verification, GitHub showcase site, and workstation deployment.
2. **Established Multi-Agent Division of Labour**: Recorded Fred's operational model for pairing Claude/Codex (planning), Antigravity (coding/implementation), and OpenCode (Omarchy Q&A) into memory `fred-ai-toolchain-and-model-usage`.

---

## Session: 2026-09-13 — Scaffolding, CLI Decoupling & Initial Release (v1.0.0)

- **Date**: 2026-09-13
- **Primary AI Agent**: Antigravity (Google DeepMind) via Antigravity CLI (`agy 1.2.2`)
- **AI Model**: Gemini 3.8 Flash (High) (`gemini-3.8-flash-high`)
- **Commits**: `a4c896f` (v1.0.0 release)
- **Transcript Reference**: `61f64733-0927-40f3-9ff5-b0c9b2572d28`
- **Participants**: Fred (@greenermoose), Antigravity

### Guiding Prompts
> **Fred:**
> "In /nix/store/.../AGENTS.md it says: Building or publishing a `fred.*` Omarchy shell plugin ... Let's move those conventions from the fred.clock plan to a dedicated Fred's Omarchy plugins plan. That stuff just happened to be discussed as I was building fred.clock. But now that I'm working on a larger set, we should move this sort of thing out of a specific plugin plan to the overall plan. It looks like I haven't pushed omarchy-fred-plugin yet. Can you see that project? What is the status of it?"
>
> "Begin work on the omarchy fred plugin ecosystem. Ask if you have questions."

### Architectural Decisions
1. **Decouple Machine-Specific Nix Paths:**
   - The initial script `~/Code/omarchy-config/bin/omarchy-fred-plugin` was tightly coupled to Fred's personal Home Manager configuration (`home-manager switch --flake ...`) and `~/Code/omarchy-config`.
   - Refactored the CLI so standard user commands (`list`, `info`, `install`, `update`, `remove`, `search`) operate against standard Omarchy directories (`~/.config/omarchy/plugins/`) using standard `omarchy plugin` subcommands with zero Nix dependencies.
   - Preserved developer mode (`dev`, `diff`) for Fred's dual-artifact workflow, auto-detecting `~/Code/omarchy-config` or using `FRED_CONFIG_REPO`.
2. **Marketplace Registry Verification:**
   - Implemented dynamic querying against `omacom/omarchy-plugin-marketplace/main/registry.json` with a 1-hour cache in `~/.cache/omarchy-fred-plugin/registry.json`.
   - Surfaces verified vs. review-in-progress status (such as `fred.workspaces` verified, `fred.clock` in review on issue #6509).
3. **Public GitHub Showcase Webpage:**
   - Created static showcase in `docs/index.html` published via GitHub Pages (`greenermoose.github.io/omarchy-fred-plugin`).
   - Explains Fred's Omarchy Linux hardware standardization strategy and details AI pair-programming methodology.
