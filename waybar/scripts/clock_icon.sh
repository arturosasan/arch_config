#!/bin/bash

# Obtener la hora y fecha actual
hour=$(date +%-I)  # Hora en formato 12h
minute=$(date +%-M)
time=$(date "+%H:%M")
#day=$(date "+%A" | sed 's/Monday/Lunes/;s/Tuesday/Martes/;s/Wednesday/Miércoles/;s/Thursday/Jueves/;s/Friday/Viernes/;s/Saturday/Sábado/;s/Sunday/Domingo/')
date_str=$(date "+%d/%m")

# Array de iconos de reloj usando Nerd Font (Font Awesome)
# Formato 12 horas con iconos visibles
declare -a clock_icons=(
    "󱐿"  # 1:00
    "󱑀"  # 2:00
    "󱑁"  # 3:00
    "󱑂"  # 4:00
    "󱑃"  # 5:00
    "󱑄"  # 6:00
    "󱑅"  # 7:00
    "󱑆"  # 8:00
    "󱑇"  # 9:00
    "󱑈"  # 10:00
    "󱑉"  # 11:00
    "󱑊"  # 12:00
)

# Calcular índice basado en la hora (0-11 para formato 12h)
hour_index=$((hour - 1))
[ $hour_index -lt 0 ] && hour_index=11

clock_icon="${clock_icons[$hour_index]}"

# Devolver JSON para waybar con formato: icono | hora | día fecha
echo "{\"text\":\"$clock_icon  $time $date_str\", \"tooltip\":\"$(date '+%d de %B de %Y, %H:%M:%S')\"}"