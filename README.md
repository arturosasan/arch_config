# ⚙️ Configuraciones de arturosasan

Repositorio con mis configuraciones de **Arch Linux + Hyprland** para reinstalar todo rápido y tener el mismo entorno al instante. 🚀

## 📦 Contenido

### 🪟 Window Manager
| Carpeta | App | Descripción |
|---------|-----|-------------|
| `hypr/` | Hyprland | WM, hyprlock, hyprpaper, wallpapers y scripts |
| `waybar/` | Waybar | Status bar con estilo Noctalia Red |
| `rofi/` | Rofi | Lanzador de aplicaciones con tema tokyo |

### 🔔 Notificaciones
| Carpeta | App | Descripción |
|---------|-----|-------------|
| `swaync/` | SwayNC | Centro de notificaciones con tema oscuro rojo |

### 🖥️ Terminal
| Carpeta | App | Descripción |
|---------|-----|-------------|
| `kitty/` | Kitty | Terminal emulador con JetBrains Mono Nerd Font |
| `btop/` | btop | Monitor del sistema con tema noctalia |
| `cava/` | CAVA | Visualizador de audio |
| `yazi/` | Yazi | File manager en terminal con flavor noctalia |

### ✏️ Editor
| Carpeta | App | Descripción |
|---------|-----|-------------|
| `nvim/` | Neovim | Editor con LazyVim bootstrap |

### 🎨 Sistema y tema
| Carpeta | App | Descripción |
|---------|-----|-------------|
| `gtk-3.0/` | GTK3 | Tema oscuro Adwaita, appmenu module |
| `fontconfig/` | Fontconfig | Configuración de fuentes (hinting, antialias) |
| `waypaper/` | Waypaper | GUI para cambiar fondos de pantalla |

### 🏠 Dotfiles de `$HOME`
| Archivo | Descripción |
|---------|-------------|
| `home/.zshrc` | Zsh + oh-my-zsh + powerlevel10k |
| `home/.p10k.zsh` | Tema powerlevel10k (nerdfont-v3) |
| `home/.zprofile` | Añade `~/.local/bin` al PATH |
| `home/.bashrc` | Bash config |
| `home/.bash_profile` | Bash profile |
| `home/.gitconfig` | Git config (user, email, gh credential) |
| `home/.profile` | Añade JetBrains Toolbox al PATH |
| `home/Scripts/` | Scripts varios (brillo, cloudflare, acceso) |

### 📄 Archivos sueltos
| Archivo | Descripción |
|---------|-------------|
| `mimeapps.list` | Asociaciones MIME (zen, xournalpp, etc.) |
| `user-dirs.dirs` | Directorios de usuario en español |
| `user-dirs.locale` | Locale `es_ES` |

---

## 🔧 Dependencias del sistema

El script `setup.sh` comprueba que estén instaladas. No instala nada, solo avisa si falta algo.

### Esenciales para Hyprland
| Paquete | Para qué |
|---------|----------|
| `hyprland` | Window manager |
| `waybar` | Status bar |
| `rofi` | Lanzador de aplicaciones |
| `hyprpaper` | Gestor de fondos de pantalla |
| `hyprlock` | Pantalla de bloqueo |
| `hyprshot` | Capturas de pantalla |
| `swaync` | Centro de notificaciones |
| `brightnessctl` | Control de brillo |
| `playerctl` | Control de reproducción multimedia |

### 🎵 Audio (PipeWire)
| Paquete | Para qué |
|---------|----------|
| `pipewire` | Servidor de audio |
| `pipewire-pulse` | Compatibilidad PulseAudio |
| `wireplumber` | Gestor de sesiones |
| `pamixer` | Control de volumen desde waybar |
| `pulseaudio-utils` | `pactl` para teclas de volumen |

### 🖥️ Terminal y herramientas
| Paquete | Para qué |
|---------|----------|
| `kitty` | Terminal |
| `btop` | Monitor del sistema |
| `cava` | Visualizador de audio |
| `yazi` | File manager |
| `neovim` | Editor |
| `eza` | `ls` moderno (alias en .zshrc) |
| `bat` | `cat` con syntax highlighting (alias en .zshrc) |
| `fastfetch` | Info del sistema (binding `$mainMod+F`) |

### 🌐 Apps (keybindings)
| App | Binding | Paquete |
|-----|---------|---------|
| Zen Browser | `$mainMod+B` | `zen-browser` |
| VSCodium | `$mainMod+C` | `codium` |
| IntelliJ IDEA | `$mainMod+I` | `intellij-idea-community` |
| Thunderbird | `$mainMod+M` | `thunderbird` |
| KeePassXC | `$mainMod+K` | `keepassxc` |
| Xournal++ | `$mainMod+X` | `xournalpp` |
| Nautilus | `$mainMod+A` | `nautilus` |
| Dolphin | `$mainMod+SHIFT+D` | `dolphin` |
| Obsidian | `$mainMod+O` | `obsidian` |
| Pear Desktop | `$mainMod+P` | `pear-desktop` |
| Spotify | `$mainMod+S` | `flatpak run com.spotify.Client` |
| Topgrade | `$mainMod+SHIFT+T` | `topgrade` |

### 🔤 Fuentes
- `ttf-jetbrains-mono-nerd` — Terminal, waybar, hyprlock, rofi
- `ttf-iosevka-nerd` — Rofi

---

## 🚀 Instalación

### 1️⃣ Clonar el repo

```bash
git clone https://github.com/arturosasan/arch_config.git ~/.config
```

### 2️⃣ Ejecutar el script

```bash
cd ~/.config
chmod +x setup.sh
./setup.sh
```

El script comprueba qué aplicaciones tienes instaladas y copia solo sus configuraciones. Las apps que faltan se saltan y se muestran como advertencia `[✗]`.

### 3️⃣ Activar servicios de usuario

```bash
systemctl --user enable --now pipewire pipewire-pulse wireplumber
systemctl --user enable --now swaync
```

### 4️⃣ Instalar Oh My Zsh y Powerlevel10k

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
  ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

---

## 🎯 Keybindings principales

| Tecla | Acción |
|-------|--------|
| `SUPER+Enter` | Terminal (kitty) |
| `SUPER+E` | File manager (yazi) |
| `SUPER+Space` | Lanzador (rofi) |
| `SUPER+Q` | Cerrar ventana |
| `SUPER+L` | Bloquear pantalla |
| `SUPER+SHIFT+M` | Cerrar sesión |
| `SUPER+SHIFT+W` | Reiniciar waybar |
| `SUPER+B` | Zen Browser |
| `SUPER+C` | VSCodium |
| `SUPER+F` | fastfetch |
| `SUPER+SHIFT+T` | topgrade |
| `SUPER+SHIFT+B` | Menú brillo (rofi) |
| `Print` | Screenshot región (portapapeles) |
| `SHIFT+Print` | Screenshot región (archivo) |
| `SUPER+Print` | Screenshot ventana |
| `SUPER+SHIFT+Print` | Screenshot monitor |
| `XF86AudioRaise/Lower` | Volumen +5%/-5% |
| `XF86AudioMute` | Silenciar |
| `XF86MonBrightnessUp/Down` | Brillo +10%/-10% |
| `XF86AudioNext/Prev/Play` | Control multimedia (playerctl) |
| `Lid Switch` | hyprlock --immediate |
| `SUPER+0-9` | Cambiar workspace |
| `SUPER+SHIFT+0-9` | Mover ventana a workspace |
