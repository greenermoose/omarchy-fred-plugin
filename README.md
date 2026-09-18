# `omarchy-fred-plugin`

Discover, install, verify, and manage Fred's Omarchy shell plugins (`fred.*`).

> ### [Visit the Live Showcase Website](https://greenermoose.github.io/omarchy-fred-plugin/)
> **[https://greenermoose.github.io/omarchy-fred-plugin/](https://greenermoose.github.io/omarchy-fred-plugin/)**
>
> View interactive screenshots of every plugin, compare feature sets across releases, and explore the multi-agent AI pair-programming architecture without having to visit each repository individually!

| Property | Value |
| :-- | :-- |
| **Showcase Website** | **[greenermoose.github.io/omarchy-fred-plugin](https://greenermoose.github.io/omarchy-fred-plugin/)** |
| **Tool** | `omarchy-fred-plugin` |
| **Version** | `1.0.1` |
| **License** | GPL-3.0-or-later |
| **Author** | Fred (@greenermoose) |
| **Platform** | Omarchy Linux (Arch Linux base, Hyprland, Quickshell) |

---

## Overview

The `omarchy-fred-plugin` CLI provides a unified interface to discover, install, update, and manage plugins in the `fred.*` Omarchy shell suite. It connects directly with the official [Omarchy Plugin Marketplace](https://github.com/omacom/omarchy-plugin-marketplace) registry to verify security audit status while providing instant access to bleeding-edge releases.

### Available Plugins in the Suite

| ID | Latest Version | Description | Marketplace Status |
| :-- | :-- | :-- | :-- |
| `fred.workspaces` | `v1.5.0` (deployed `1.5.1`) | Dynamic workspace indicator, multi-monitor desktop modes (Mac, Windows, Stock), and unused monitor idle blanking | **Verified** (Outcome: Passed) |
| `fred.clock` | `v1.3.2` | Next-event countdown badge, multi-feed iCal sync, and interactive agenda | **Verified** (Outcome: Passed) |
| `fred.sysinfo` | `v1.1.0` | Universal hardware telemetry (CPU topologies, multi-sensor thermals, memory, storage, power profiles) | Available (Submission drafted) |
| `fred.monitor` | `Planned` | Display management panel with per-display link retrain / Reset | Planned (Milestone A) |
| `fred.weather` | `v1.0.0` | 10-day outlook, 48-hour curve, and solar timeline with multi-monitor isolation | Ready for testing & submission |

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
fred.clock         1.3.2      enabled    Verified               1.3
fred.monitor       none       not installed Not Listed          Available
fred.sysinfo       1.1.0      enabled    Not Listed             1.1
fred.workspaces    1.5.1      enabled    Verified               v1.5.0
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

For local development against an `omarchy-config` dotfiles repository:

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

# Restore Home Manager store links when done
omarchy-fred-plugin dev fred.clock off

# Diff local deployed config against public published repo
omarchy-fred-plugin diff fred.clock
```

---

## AI Collaboration & Provenance

This project standardizes transparent AI prompt and model tracking across all `omarchy-fred-*` repositories. See [`AI_PROVENANCE.md`](AI_PROVENANCE.md) and [`docs/ai/sessions.md`](docs/ai/sessions.md) for full session logs, model versions, and architectural decisions.

---

## License

GNU General Public License v3.0 or later. See [`LICENSE`](LICENSE) for details.
