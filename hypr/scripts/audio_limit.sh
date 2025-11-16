#!/bin/sh
max_volume=100
current_volume=$(pactl get-sink-volume @DEFAULT_SINK@ | awk -F'/' '{print $2}' | sed 's/[^0-9]*//g')

if [ "$current_volume" -lt "$max_volume" ]; then
    pactl set-sink-volume @DEFAULT_SINK@ +5%
else
    pactl set-sink-volume @DEFAULT_SINK@ $max_volume%
fi   