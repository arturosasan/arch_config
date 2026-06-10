#!/bin/bash

# Variables (ajusta si es necesario)
REPO_PATH="$HOME/InazumaElevenSaveEditor"
BIN_PATH="$HOME/.local/bin"
ICON_PATH="$HOME/.local/share/icons"
DESKTOP_PATH="$HOME/.local/share/applications"

# Crear directorios necesarios
mkdir -p "$BIN_PATH" "$ICON_PATH" "$DESKTOP_PATH"

# Crear script de lanzamiento
cat >"$BIN_PATH/inazuma-save-editor" <<EOF
#!/bin/bash
cd "$REPO_PATH/InazumaElevenSaveEditor/bin/Release"
mono InazumaElevenSaveEditor.exe
EOF

chmod +x "$BIN_PATH/inazuma-save-editor"

# Descargar icono
wget https://raw.githubusercontent.com/Tiniifan/InazumaElevenSaveEditor/main/InazumaElevenSaveEditor/Icon/icon.png \
  -O "$ICON_PATH/inazuma-save-editor.png" 2>/dev/null

# Crear archivo .desktop
cat >"$DESKTOP_PATH/inazuma-save-editor.desktop" <<EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=Inazuma Eleven Save Editor
Comment=Save editor for Inazuma Eleven games
Exec=$BIN_PATH/inazuma-save-editor
Icon=$ICON_PATH/inazuma-save-editor.png
Terminal=false
Categories=Game;Utility;
Keywords=inazuma;save;editor;game;
StartupNotify=true
EOF

chmod +x "$DESKTOP_PATH/inazuma-save-editor.desktop"

# Actualizar cache
update-desktop-database "$DESKTOP_PATH/"

echo "✅ Acceso directo creado exitosamente!"
echo "Busca 'Inazuma' en rofi"
