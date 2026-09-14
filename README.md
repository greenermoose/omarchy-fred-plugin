# `omarchy-fred-plugin`

Discover, install, verify, and manage Fred's Omarchy shell plugins (`fred.*`).

| Property | Value |
| :-- | :-- |
| **Tool** | `omarchy-fred-plugin` |
| **Version** | `1.0.0` |
| **License** | GPL-3.0-or-later |
| **Author** | Fred (@greenermoose) |
| **Platform** | Omarchy Linux (Arch Linux base, Hyprland, Quickshell) |
| **Showcase** | [Fred's Omarchy Suite Showcase](https://greenermoose.github.io/omarchy-fred-plugin/) |

---

## Overview

The `omarchy-fred-plugin` CLI provides a unified interface to discover, install, update, and manage plugins in the `fred.*` Omarchy shell suite. It connects directly with the official [Omarchy Plugin Marketplace](https://github.com/omacom/omarchy-plugin-marketplace) registry to verify security audit status while providing instant access to bleeding-edge releases.

### Available Plugins in the Suite

| ID | Description | Marketplace Status |
| :-- | :-- | :-- |
| `fred.workspaces` | Dynamic workspace indicator with multi-monitor desktop mode switcher | **Verified** (Outcome: Passed) |
| `fred.clock` | Next-event countdown badge, multi-feed iCal sync, and interactive agenda | In Review (Issue #6509) |
| `fred.sysinfo` | Universal hardware telemetry and system monitoring bar widget | Available (Submission drafted) |
| `fred.monitor` | Display management panel with per-display link retrain / Reset | Planned (Milestone A) |

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
fred.workspaces    1.2.1      enabled    Verified               1.2
fred.clock         1.3.0      enabled    In Review              v1.3.0
fred.sysinfo       1.0.0      enabled    Not Listed             1.0
fred.monitor       none       not installed Not Listed          Available
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

# Edit QML files with instant Quickshell hot-reload:
# ~/Code/omarchy-config/config/omarchy/plugins/fred.clock/...

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
