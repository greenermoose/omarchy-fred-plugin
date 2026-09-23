# Session: 2026-09-22 — Rebrand the suite to Tamlinux

- **CLI Tool**: Cursor `3.21.16`
- **Model**: `composer`
- **Transcript Reference**: `88a15629-5548-46a5-9948-f82903a2e6be`

## Prompts

> Create a tamlinux repo that explains what Tamlinux is: Fred's personal linux distro. In all the *-fred-tamlinux repos, replace mentions of Omarchy Linux with Tamlinux.

Showcase title and tagline were specified as Fred's Tamlinux Plugin Suite and plugins for Tamlinux (Hyprland + Quickshell).

## Key Decisions & Implementation Notes

- User-facing branding only. `omarchy plugin add`, marketplace links, and `~/.config/omarchy/` stay.
- Leftover showcase identity (`omarchy-fred-plugin` curl URL and CLI examples) updated to `plugin-fred-tamlinux` / `tam-plugin` on this page.
- Added a Tamlinux badge linking to `greenermoose/tamlinux`.

## Verification

- Showcase title, lead, motivation, footer, and installer URL no longer say Omarchy Linux or `omarchy-fred-plugin`.
- `omarchy plugin add` install lines and marketplace links are unchanged.
