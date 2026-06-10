#!/bin/bash

# ============================================================
# setup.sh — Verifica dependencias e instala configuraciones
# ============================================================

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"
CONFIG_DST="$HOME/.config"

VERDE='\033[0;32m'
ROJO='\033[0;31m'
AMARILLO='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m'

ok="[${VERDE}✓${NC}]"
no="[${ROJO}✗${NC}]"
warn="[${AMARILLO}!${NC}]"

check_app() {
    local name="$1"
    local pkg="$2"
    if command -v "$name" &>/dev/null; then
        echo -e "$ok $name"
        return 0
    fi
    if [ -n "$pkg" ] && pacman -Q "$pkg" &>/dev/null 2>&1; then
        echo -e "$ok $name (paquete: $pkg)"
        return 0
    fi
    echo -e "$no $name — NO INSTALADO, saltando configuración"
    return 1
}

check_flatpak() {
    local app_id="$1"
    if flatpak list --columns=application 2>/dev/null | grep -q "^$app_id$"; then
        echo -e "$ok $app_id (flatpak)"
        return 0
    fi
    echo -e "$warn $app_id (flatpak) — NO INSTALADO"
    return 1
}

install_dir() {
    local src="$1"
    local dst="$2"
    local label="$3"
    if [ -d "$src" ]; then
        mkdir -p "$(dirname "$dst")"
        cp -r "$src" "$dst"
        echo -e "  ${CYAN}→${NC} Configuración copiada: $label"
    fi
}

install_file() {
    local src="$1"
    local dst="$2"
    local label="$3"
    if [ -f "$src" ]; then
        mkdir -p "$(dirname "$dst")"
        cp "$src" "$dst"
        echo -e "  ${CYAN}→${NC} Configuración copiada: $label"
    fi
}

echo ""
echo "=========================================="
echo "  Verificando dependencias e instalando"
echo "  configuraciones de arturosasan"
echo "=========================================="
echo ""

# ---- WINDOW MANAGER ----
echo -e "${CYAN}--- Window Manager ---${NC}"

echo -n "Hyprland   "; check_app "Hyprland" "hyprland" \
    && install_dir "$REPO_DIR/hypr" "$CONFIG_DST/hypr" "hypr/"

echo -n "Waybar     "; check_app "waybar" "waybar" \
    && install_dir "$REPO_DIR/waybar" "$CONFIG_DST/waybar" "waybar/"

echo -n "Rofi       "; check_app "rofi" "rofi" \
    && install_dir "$REPO_DIR/rofi" "$CONFIG_DST/rofi" "rofi/"

echo ""

# ---- TERMINAL ----
echo -e "${CYAN}--- Terminal ---${NC}"

echo -n "Kitty      "; check_app "kitty" "kitty" \
    && install_dir "$REPO_DIR/kitty" "$CONFIG_DST/kitty" "kitty/"

echo -n "btop       "; check_app "btop" "btop" \
    && install_dir "$REPO_DIR/btop" "$CONFIG_DST/btop" "btop/"

echo -n "cava       "; check_app "cava" "cava" \
    && install_dir "$REPO_DIR/cava" "$CONFIG_DST/cava" "cava/"

echo -n "yazi       "; check_app "yazi" "yazi" \
    && install_dir "$REPO_DIR/yazi" "$CONFIG_DST/yazi" "yazi/"

echo ""

# ---- EDITOR ----
echo -e "${CYAN}--- Editor ---${NC}"

echo -n "Neovim     "; check_app "nvim" "neovim" \
    && install_dir "$REPO_DIR/nvim" "$CONFIG_DST/nvim" "nvim/"

echo ""

# ---- SHELL / GTK / FONTES ----
echo -e "${CYAN}--- Sistema ---${NC}"

echo -n "GTK 3      "; check_app "gtk3-widget-factory" "gtk3" \
    && install_dir "$REPO_DIR/gtk-3.0" "$CONFIG_DST/gtk-3.0" "gtk-3.0/"

echo -n "Fontconfig ";

install_dir "$REPO_DIR/fontconfig" "$CONFIG_DST/fontconfig" "fontconfig/"
echo -e "  ${CYAN}→${NC} fontconfig (siempre presente)"

echo ""

# ---- NOCTALIA SHELL ----
echo -e "${CYAN}--- Noctalia ---${NC}"

echo -n "Noctalia   "; check_app "qs" "noctalia-shell" \
    && install_dir "$REPO_DIR/backup-noctalia/config/noctalia" "$CONFIG_DST/noctalia" "noctalia/"

echo ""

# ---- FILES SUELTOS ----
echo -e "${CYAN}--- Archivos del sistema ---${NC}"

install_file "$REPO_DIR/mimeapps.list" "$CONFIG_DST/mimeapps.list" "mimeapps.list"
install_file "$REPO_DIR/user-dirs.dirs" "$CONFIG_DST/user-dirs.dirs" "user-dirs.dirs"
install_file "$REPO_DIR/user-dirs.locale" "$CONFIG_DST/user-dirs.locale" "user-dirs.locale"

echo ""

# ---- DOTFILES DE $HOME ----
echo -e "${CYAN}--- Dotfiles de \$HOME ---${NC}"

echo -n "Zsh        "; check_app "zsh" "zsh" && (
    install_file "$REPO_DIR/home/.zshrc" "$HOME/.zshrc" ".zshrc"
    install_file "$REPO_DIR/home/.p10k.zsh" "$HOME/.p10k.zsh" ".p10k.zsh"
    install_file "$REPO_DIR/home/.zprofile" "$HOME/.zprofile" ".zprofile"
)

echo -n "Bash       "; check_app "bash" "bash" && (
    install_file "$REPO_DIR/home/.bashrc" "$HOME/.bashrc" ".bashrc"
    install_file "$REPO_DIR/home/.bash_profile" "$HOME/.bash_profile" ".bash_profile"
)

echo -n "Git        "; check_app "git" "git" \
    && install_file "$REPO_DIR/home/.gitconfig" "$HOME/.gitconfig" ".gitconfig"

echo -n "Scripts    ";
if [ -d "$REPO_DIR/home/Scripts" ]; then
    install_dir "$REPO_DIR/home/Scripts" "$HOME/Scripts" "Scripts/"
else
    echo -e "  $warn Scripts/ no encontrado en el repo"
fi

echo ""
echo "=========================================="
echo "  Proceso completado."
echo "  Revisa los [✗] para saber qué falta."
echo "=========================================="
echo ""
