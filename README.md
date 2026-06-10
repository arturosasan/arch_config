# Configuraciones de arturosasan

Repositorio con mis configuraciones de Arch Linux para reinstalar todo rápido.

## Contenido

### Window Manager
| Carpeta | App | Descripción |
|---------|-----|-------------|
| `hypr/` | Hyprland | WM, hyprlock, hyprpaper, scripts y wallpapers |
| `waybar/` | Waybar | Status bar con estilo personalizado |
| `rofi/` | Rofi | Lanzador de aplicaciones |

### Terminal
| Carpeta | App | Descripción |
|---------|-----|-------------|
| `kitty/` | Kitty | Terminal emulator |
| `btop/` | btop | Monitor del sistema |
| `cava/` | CAVA | Visualizador de audio |
| `yazi/` | Yazi | File manager en terminal |

### Otros
| Carpeta | App | Descripción |
|---------|-----|-------------|
| `nvim/` | Neovim | Editor con LazyVim |
| `gtk-3.0/` | GTK3 | Tema gráfico |
| `fontconfig/` | Fontconfig | Configuración de fuentes |
| `backup-noctalia/` | Noctalia Shell | Plugins QML del shell |

### Dotfiles de $HOME
| Archivo | Descripción |
|---------|-------------|
| `home/.zshrc` | Zsh + oh-my-zsh + powerlevel10k |
| `home/.p10k.zsh` | Tema powerlevel10k |
| `home/.bashrc` | Bash config |
| `home/.bash_profile` | Bash profile |
| `home/.gitconfig` | Git config |
| `home/Scripts/` | Scripts varios (brillo, cloudflare, etc.) |

## Instalación

### 1. Clonar el repo

```bash
git clone https://github.com/arturosasan/arch_config.git ~/.config
```

### 2. Ejecutar el script

```bash
cd ~/.config
chmod +x setup.sh
./setup.sh
```

El script comprueba qué aplicaciones tienes instaladas y copia solo sus configuraciones. Las apps que faltan se saltan y se muestran como advertencia.

### 3. Instalar paquetes que falten

Revisa el output del script para ver qué apps no están instaladas e instálalas con pacman/yay:

```bash
sudo pacman -S hyprland kitty neovim rofi waybar btop cava yazi
yay -S noctalia-shell
```
