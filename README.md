# Manage Fred's omarchy plugins (omarchy-fred-plugin)

Discover, install, verify, and manage Fred's Omarchy shell plugins (`fred.*`).

> ### [Fred's Omarchy Plugin Showcase](https://greenermoose.github.io/omarchy-fred-plugin/)
> **[https://greenermoose.github.io/omarchy-fred-plugin/](https://greenermoose.github.io/omarchy-fred-plugin/)**
>
> See the full gallery of Fred's omarchy plugins.

| Property | Value |
| :-- | :-- |
| **Showcase Website** | **[greenermoose.github.io/omarchy-fred-plugin](https://greenermoose.github.io/omarchy-fred-plugin/)** |
| **Tool** | `omarchy-fred-plugin` |
| **Version** | `1.0.1` |
| **License** | GPL-3.0-or-later |
| **Authors** | Fred (@greenermoose), Gemini 3.8 Flash, Codex (gpt-5.6-sol), Claude Opus 5 |
| **Platform** | Omarchy Linux (Arch Linux base, Hyprland, Quickshell) |

---

## Overview

The `omarchy-fred-plugin` CLI provides a unified interface to discover, install, update, and manage plugins in the `fred.*` Omarchy shell suite. It connects directly with the official [Omarchy Plugin Marketplace](https://github.com/omacom/omarchy-plugin-marketplace) registry to verify security audit status while providing instant access to bleeding-edge releases.

### Available Plugins in the Suite

| ID | Latest Version | Description | Marketplace Status |
| :-- | :-- | :-- | :-- |
| `fred.workspaces` | `v1.5.1` | Workspace numbers with clickable desktop modes (Mac, Windows, Stock), dynamic Windows sets, and unused monitor idle blanking | **Verified** (Outcome: Passed) |
| `fred.clock` | `v1.3.3` | Next-event countdown badge, multi-feed iCal sync, interactive agenda, and local event management | **Verified** (Outcome: Passed) |
| `fred.sysinfo` | `v1.1.2` | Universal hardware telemetry with a fresh CPU, available RAM, and free-disk hover summary | Available (In testing) |
| `fred.monitor` | `v1.0.0` | Display management panel with per-display link retrain / Reset, position labels, and stock monitor fallback | Available (Milestone B complete) |
| `fred.weather` | `v1.0.3` | Multi-monitor weather widget with current conditions, 48-hour timeline, 10-day forecast, and solar timeline | Available (Ready for submission) |
| `fred.tides` | `v1.0.3` | Multi-monitor tide widget with current sea level, 24-hour scrubbable curve, and high/low timeline | Available (Submission #7664) |
| `fred.keyboard` | `v1.0.0` | Keyboard shortcut visualizer: your actual keyboard, bound keys tinted, capture mode that tells you what any key combination or mouse action runs, and search from a command to its keys | Released; marketplace submission #7860 validated, awaiting listing review |
| `fred.agents` | `v1.0.0` | AI agent usage bar plugin: Antigravity, Claude, Codex, and Cursor prompt/token activity at a glance | Available (In testing) |

---

## Installation

### One-line curl installer
```bash
curl -sSL https://raw.githubusercontent.com/greenermoose/omarchy-fred-plugin/main/install.sh | bash
```

### Manual installation
```bash
git clone https://github.com/greenermoose/omarchy-fred-plugin.git ~/Code/omarchy-fred-plugin
ln -s ~/Code/omarchy-fred-plugin/bin/omarchy-fred-plugin ~/.local/bin/omarchy-fred-plugin
```

Ensure `~/.local/bin` is in your `PATH`.

---

## CLI Usage

### 1. List Installed and Available Plugins
```bash
# Show installed fred.* plugins and their status
omarchy-fred-plugin list

# Show all plugins in the catalog (including uninstalled)
omarchy-fred-plugin list --all

# Force refresh the marketplace registry cache
omarchy-fred-plugin list --refresh
```

Example output:
```text
ID                 INSTALLED  STATE      MARKETPLACE            LATEST GITHUB / LOCAL
fred.agents        1.0.0      enabled    Not Listed             v1.0.0
fred.clock         1.3.3      enabled    Verified               v1.3.3
fred.keyboard      1.0.0      enabled    Not Listed             v1.0.0
fred.monitor       1.0.0      enabled    Not Listed             v1.0.0
fred.sysinfo       1.1.2      enabled    Not Listed             v1.1.2
fred.tides         1.0.3      enabled    Not Listed             v1.0.3
fred.weather       1.0.3      enabled    Not Listed             1.0.3
fred.workspaces    1.5.1      enabled    Verified               v1.5.1
```

### 2. Inspect Plugin Details
```bash
omarchy-fred-plugin info fred.workspaces
```

Outputs upstream repository URL, local install path, manifest author, version, and official Omarchy marketplace verification records.

### 3. Install a Plugin
```bash
# Install and immediately enable in Omarchy shell
omarchy-fred-plugin install fred.workspaces --enable
```

### 4. Update Plugins
```bash
# Update all installed fred.* plugins
omarchy-fred-plugin update all

# Update a specific plugin
omarchy-fred-plugin update fred.clock
```

### 5. Remove a Plugin
```bash
omarchy-fred-plugin remove fred.clock
```

### 6. Search the Catalog
```bash
omarchy-fred-plugin search monitor
```

---

## Developer Workflow (Dual-Artifact Mode)

### Manual development in the published repository

`test` deploys an immutable snapshot from
`~/Code/omarchy-fred-<name>`. Editing the repository afterward does not
change the running plugin until `test` is run again.

```bash
cd ~/Code/omarchy-fred-agents
git switch -c manual/my-change

# Edit, inspect, and validate without affecting the running system.
$EDITOR Main.qml
git diff
git diff --check
omarchy plugin validate .

# Snapshot the current working tree and test it locally.
omarchy-fred-plugin test fred.agents
omarchy-fred-plugin test fred.agents status

# After more edits, deploy a new snapshot. Undo toggles between the two most
# recently tested snapshots; off restores the exact pre-test installation.
omarchy-fred-plugin test fred.agents
omarchy-fred-plugin test fred.agents undo
omarchy-fred-plugin test fred.agents off

# A Git ref can be tested independently of uncommitted working-tree changes.
omarchy-fred-plugin test fred.agents HEAD~1
```

Snapshots and their metadata live under
`${XDG_STATE_HOME:-~/.local/state}/omarchy-fred-plugin/test/<id>/`. The
original live plugin directory is moved there while test mode is active and
restored by `test <id> off`. Test mode refuses to replace an existing dev
symlink, and dev mode refuses to replace an active test snapshot.

### Fast editing in the deployed configuration

For the established development workflow against an `omarchy-config`
dotfiles repository:

```bash
# Toggle fast QML development symlink override (bypasses read-only store symlinks)
omarchy-fred-plugin dev fred.clock on

# Edit QML files in ~/Code/omarchy-config/config/omarchy/plugins/fred.clock/...
# manifest.json edits are picked up live; QML/JS edits are not: Quickshell 0.3.1
# cannot clear its in-memory component cache, and Qt's on-disk qmlcache trusts
# the source mtime (a constant 1970 for Nix store files). `dev on|off` and
# `update` purge ~/.cache/quickshell/qmlcache for the plugins and restart the
# shell; after a plain home-manager switch do the same by hand:
omarchy-fred-plugin dev fred.clock off   # or: omarchy-restart-shell after purging

# Restore Home Manager store links when done. This refuses to switch while
# another plugin override remains, because Home Manager could otherwise
# replace differing files through that symlink. It also refuses while this
# plugin has uncommitted deployed-copy changes.
omarchy-fred-plugin dev fred.clock off

# Diff local deployed config against public published repo
omarchy-fred-plugin diff fred.clock
```

---

## Acknowledgments

Developed through transparent multi-agent AI pair programming with [Antigravity](https://antigravity.google) (Google DeepMind), Claude (Anthropic), and Codex (OpenAI). This project standardizes transparent AI prompt and model tracking across all `omarchy-fred-*` repositories. See [`AI_PROVENANCE.md`](AI_PROVENANCE.md) and [`docs/ai/`](docs/ai/) for session logs, model versions, and architectural decisions.

---

## License

GNU General Public License v3.0 or later. See [`LICENSE`](LICENSE) for details.
