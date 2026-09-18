#!/usr/bin/env bash
# install.sh — Installs omarchy-fred-plugin CLI to ~/.local/bin/
#
# Usage:
#   curl -sSL https://raw.githubusercontent.com/greenermoose/omarchy-fred-plugin/main/install.sh | bash

set -euo pipefail

BIN_DIR="${HOME}/.local/bin"
TARGET="${BIN_DIR}/omarchy-fred-plugin"
SRC_URL="https://raw.githubusercontent.com/greenermoose/omarchy-fred-plugin/main/bin/omarchy-fred-plugin"

echo "Installing omarchy-fred-plugin..."

mkdir -p "$BIN_DIR"

if command -v curl >/dev/null 2>&1; then
  curl -sSL "$SRC_URL" -o "$TARGET"
elif command -v wget >/dev/null 2>&1; then
  wget -qO "$TARGET" "$SRC_URL"
else
  echo "Error: curl or wget is required to download omarchy-fred-plugin." >&2
  exit 1
fi

chmod +x "$TARGET"

echo "Successfully installed omarchy-fred-plugin to $TARGET"

if [[ ":$PATH:" != *":$BIN_DIR:"* ]]; then
  echo "Note: $BIN_DIR is not in your PATH. Add it to your shell configuration (.bashrc, .zshrc):"
  echo "  export PATH=\"\$HOME/.local/bin:\$PATH\""
fi

echo "Run 'omarchy-fred-plugin --help' to get started."
