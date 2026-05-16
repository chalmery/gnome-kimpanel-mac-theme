#!/bin/bash
set -e

EXT_DIR="$HOME/.local/share/gnome-shell/extensions/kimpanel@kde.org"
SCHEMA_DIR="$HOME/.local/share/glib-2.0/schemas"
SRC_DIR="$(cd "$(dirname "$0")" && pwd)"

if [ ! -d "$EXT_DIR" ]; then
    echo "Error: $EXT_DIR not found."
    echo "Install the kimpanel extension first:"
    echo "  https://github.com/wengxt/gnome-shell-extension-kimpanel"
    exit 1
fi

echo "==> Overriding with macOS theme files..."
cp "$SRC_DIR/stylesheet.css" \
   "$SRC_DIR/panel.png" \
   "$SRC_DIR/highlight.png" \
   "$EXT_DIR/"

echo "==> Registering GSettings schema..."
mkdir -p "$SCHEMA_DIR"
cp "$SRC_DIR/org.gnome.shell.extensions.kimpanel.gschema.xml" "$SCHEMA_DIR/"
glib-compile-schemas "$SCHEMA_DIR"

echo "==> Done! Log out and back in to apply."
