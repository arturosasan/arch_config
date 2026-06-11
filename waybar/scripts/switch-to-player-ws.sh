#!/bin/bash

player=$(playerctl -l 2>/dev/null | head -1)
[ -z "$player" ] && exit 0

ws=$(hyprctl clients -j 2>/dev/null | python3 -c "
import json, sys, re

full = '$player'
clients = json.load(sys.stdin)

# 1. PID matching (Electron apps: Pear Desktop, etc.)
match = re.search(r'(?:\.instance|\.)(\d+)$', full)
if match:
    target_pid = int(match.group(1))
    for c in clients:
        if c.get('pid') == target_pid:
            print(c['workspace']['id'])
            sys.exit(0)

# 2. Name matching fallback (Spotify, Firefox, etc.)
player_lower = full.lower()
for c in clients:
    cls = c.get('class', '').lower()
    title = c.get('title', '').lower()
    if player_lower in cls or player_lower in title:
        print(c['workspace']['id'])
        sys.exit(0)
")

[ -n "$ws" ] && hyprctl dispatch workspace "$ws"
