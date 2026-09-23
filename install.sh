#!/usr/bin/env bash
# install.sh — Installs tam-plugin CLI to ~/.local/bin/
#
# Usage:
#   curl -sSL https://raw.githubusercontent.com/greenermoose/plugin-fred-tamlinux/main/install.sh | bash

set -euo pipefail

BIN_DIR="${HOME}/.local/bin"
TARGET="${BIN_DIR}/tam-plugin"
SRC_URL="https://raw.githubusercontent.com/greenermoose/plugin-fred-tamlinux/main/bin/tam-plugin"

echo "Installing tam-plugin..."

mkdir -p "$BIN_DIR"

if command -v curl >/dev/null 2>&1; then
  curl -sSL "$SRC_URL" -o "$TARGET"
elif command -v wget >/dev/null 2>&1; then
  wget -qO "$TARGET" "$SRC_URL"
else
  echo "Error: curl or wget is required to download tam-plugin." >&2
  exit 1
fi

chmod +x "$TARGET"

echo "Successfully installed tam-plugin to $TARGET"

if [[ ":$PATH:" != *":$BIN_DIR:"* ]]; then
  echo "Note: $BIN_DIR is not in your PATH. Add it to your shell configuration (.bashrc, .zshrc):"
  echo "  export PATH=\"\$HOME/.local/bin:\$PATH\""
fi

echo "Run 'tam-plugin --help' to get started."
