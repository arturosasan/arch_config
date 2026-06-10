#!/bin/bash

# Función para mostrar notificación de brillo con mako
notify_brightness() {
  MAX_BRIGHTNESS=$(brightnessctl max)
  CURRENT_BRIGHTNESS=$(brightnessctl get)
  BRIGHTNESS_PERCENT=$(awk "BEGIN {printf \"%.0f\", ($CURRENT_BRIGHTNESS / $MAX_BRIGHTNESS) * 100}")

  # Crear barra de progreso visual
  bar_length=20
  filled=$((BRIGHTNESS_PERCENT * bar_length / 100))
  bar=$(printf "█%.0s" $(seq 1 $filled))
  bar+=$(printf "░%.0s" $(seq 1 $((bar_length - filled))))

  # Notificación con mako usando notify-send
  notify-send -t 2000 -h string:x-canonical-private-synchronous:brightness \
    -u normal "󰃞 Brillo" "${BRIGHTNESS_PERCENT}%\n${bar}"
}

# Menú Rofi con estilo minimalista
choice=$(echo -e " Aumentar\n Reducir\n☼ Mínimo\n☀ Máximo" | rofi -dmenu \
  -theme-str 'window {width: 300px; border-radius: 14px;}' \
  -theme-str 'listview {lines: 4;}' \
  -theme-str 'element {padding: 8px 12px; border-radius: 8px;}' \
  -theme-str 'inputbar {enabled: false;}' \
  -theme-str 'element-text {horizontal-align: 0.5;}' \
  -p "")

case "$choice" in
" Aumentar")
  brightnessctl set +10% && notify_brightness
  ;;
" Reducir")
  brightnessctl set 10%- && notify_brightness
  ;;
"☼ Mínimo")
  brightnessctl set 1% && notify_brightness
  ;;
"☀ Máximo")
  brightnessctl set 100% && notify_brightness
  ;;
esac
