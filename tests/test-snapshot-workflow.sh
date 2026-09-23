#!/usr/bin/env bash

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CLI="$ROOT_DIR/bin/tam-plugin"
TEST_DIR="$(mktemp -d)"
trap 'rm -rf -- "$TEST_DIR"' EXIT

export HOME="$TEST_DIR/home"
export FRED_LIVE_DIR="$HOME/.config/omarchy/plugins"
export FRED_TEST_ROOT="$HOME/.local/state/tam-plugin/test"
export FRED_PUBLISHED_ROOT="$HOME/Code"
export FRED_CONFIG_REPO="$HOME/Code/tamlinux/config-fred-tamlinux"

mkdir -p "$HOME/bin" "$FRED_LIVE_DIR/fred.demo" \
  "$FRED_PUBLISHED_ROOT/demo-fred-tamlinux" \
  "$FRED_CONFIG_REPO/config/omarchy/plugins/fred.demo"
printf 'managed-version\n' > "$FRED_LIVE_DIR/fred.demo/value.txt"

cat > "$HOME/bin/omarchy" <<'EOF'
#!/usr/bin/env bash
set -euo pipefail
[[ "${1:-}" == "plugin" && "${2:-}" == "validate" ]]
[[ -f "${3:-}/manifest.json" ]]
EOF
cat > "$HOME/bin/omarchy-shell" <<'EOF'
#!/usr/bin/env bash
exit 0
EOF
cat > "$HOME/bin/omarchy-restart-shell" <<'EOF'
#!/usr/bin/env bash
exit 0
EOF
chmod +x "$HOME/bin/omarchy" "$HOME/bin/omarchy-shell" "$HOME/bin/omarchy-restart-shell"
export PATH="$HOME/bin:$PATH"

repo="$FRED_PUBLISHED_ROOT/demo-fred-tamlinux"
git -C "$repo" init -q
git -C "$repo" config user.name Test
git -C "$repo" config user.email test@example.invalid
cat > "$repo/manifest.json" <<'EOF'
{
  "id": "fred.demo",
  "name": "Snapshot test fixture",
  "version": "1.0.0",
  "author": "Test",
  "license": "GPL-3.0-or-later",
  "kinds": ["bar-widget"],
  "entryPoints": {"barWidget": "Main.qml"}
}
EOF
printf 'version-one\n' > "$repo/Main.qml"
git -C "$repo" add manifest.json Main.qml
git -C "$repo" commit -qm 'fixture v1'

"$CLI" test fred.demo
[[ -L "$FRED_LIVE_DIR/fred.demo" ]]
[[ "$(cat "$FRED_LIVE_DIR/fred.demo/Main.qml")" == "version-one" ]]

# Editing after deployment must not change the immutable running snapshot.
printf 'version-two\n' > "$repo/Main.qml"
[[ "$(cat "$FRED_LIVE_DIR/fred.demo/Main.qml")" == "version-one" ]]

"$CLI" test fred.demo worktree
[[ "$(cat "$FRED_LIVE_DIR/fred.demo/Main.qml")" == "version-two" ]]

"$CLI" test fred.demo undo
[[ "$(cat "$FRED_LIVE_DIR/fred.demo/Main.qml")" == "version-one" ]]

"$CLI" test fred.demo undo
[[ "$(cat "$FRED_LIVE_DIR/fred.demo/Main.qml")" == "version-two" ]]

status_output="$("$CLI" test fred.demo status)"
[[ "$status_output" == *"mode ON"* ]]
[[ "$status_output" == *"working-tree-dirty: yes"* ]]

if "$CLI" dev fred.demo on >/dev/null 2>&1; then
  echo "dev mode unexpectedly replaced an active test snapshot" >&2
  exit 1
fi

"$CLI" test fred.demo off
[[ ! -L "$FRED_LIVE_DIR/fred.demo" ]]
[[ "$(cat "$FRED_LIVE_DIR/fred.demo/value.txt")" == "managed-version" ]]

# A named ref comes from Git, not from the dirty working tree.
"$CLI" test fred.demo HEAD
[[ "$(cat "$FRED_LIVE_DIR/fred.demo/Main.qml")" == "version-one" ]]
"$CLI" test fred.demo off

if "$CLI" test '../bad' >/dev/null 2>&1; then
  echo "invalid plugin id unexpectedly succeeded" >&2
  exit 1
fi

echo "snapshot workflow tests passed"
