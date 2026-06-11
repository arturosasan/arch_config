#!/bin/bash

options="  Apagar\n  Reiniciar\n  Suspender\n  Cerrar sesión"

choice=$(echo -e "$options" | rofi -dmenu -p "Power" -theme-str 'window {width: 200px;} listview {lines: 4;}')

case "$choice" in
    *Apagar) systemctl poweroff ;;
    *Reiniciar) systemctl reboot ;;
    *Suspender) systemctl suspend ;;
    *"Cerrar sesión") hyprctl dispatch exit ;;
esac
