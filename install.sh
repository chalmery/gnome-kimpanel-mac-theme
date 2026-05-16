#!/bin/bash
set -e

EXT_DIR="$HOME/.local/share/gnome-shell/extensions/kimpanel@kde.org"
SCHEMA_DIR="$HOME/.local/share/glib-2.0/schemas"
SRC_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "==> Installing kimpanel extension to $EXT_DIR"

rm -rf "$EXT_DIR"
mkdir -p "$EXT_DIR"
cp "$SRC_DIR/extension.js" \
   "$SRC_DIR/indicator.js" \
   "$SRC_DIR/lib.js" \
   "$SRC_DIR/menu.js" \
   "$SRC_DIR/panel.js" \
   "$SRC_DIR/prefs.js" \
   "$SRC_DIR/stylesheet.css" \
   "$SRC_DIR/metadata.json" \
   "$SRC_DIR/panel.png" \
   "$SRC_DIR/highlight.png" \
   "$EXT_DIR/"
cp -r "$SRC_DIR/locale" "$EXT_DIR/"
cp -r "$SRC_DIR/schemas" "$EXT_DIR/"

echo "==> Installing GSettings schema"
mkdir -p "$SCHEMA_DIR"
cp "$SRC_DIR/schemas/org.gnome.shell.extensions.kimpanel.gschema.xml" "$SCHEMA_DIR/"
glib-compile-schemas "$SCHEMA_DIR"

echo "==> Done!"
echo "Log out and back in (or restart GNOME Shell) to apply."
echo "On X11: Alt+F2, type 'r', press Enter"
echo "On Wayland: log out and back in"
