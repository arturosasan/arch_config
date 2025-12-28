#!/bin/bash

# Encuentra el workspace donde está Spotify
workspace=$(hyprctl clients -j | jq -r '.[] | select(.class == "Spotify" or .class == "spotify" or .initialClass == "Spotify") | .workspace.id' | head -n 1)

# Si se encuentra Spotify, cambia a ese workspace
if [ -n "$workspace" ]; then
    hyprctl dispatch workspace "$workspace"
else
    # Si no está abierto, abre Spotify
    spotify &
fi