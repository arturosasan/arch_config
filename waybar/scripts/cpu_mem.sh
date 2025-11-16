#!/usr/bin/env bash
read_cpu() {
  awk '/^cpu /{idle=$5; total=0; for(i=2;i<=NF;i++) total+=$i; print idle,total}' /proc/stat
}
read -r idle1 total1 < <(read_cpu)
sleep 0.2
read -r idle2 total2 < <(read_cpu)
idle=$((idle2-idle1))
total=$((total2-total1))
usage=$(( (1000*(total-idle)/total +5)/10 ))  # porcentaje entero con redondeo

# memoria (usa MemTotal y MemAvailable)
read -r mem_total mem_avail <<< $(awk '/MemTotal|MemAvailable/ {gsub(/kB/,""); if($1=="MemTotal:") t=$2; if($1=="MemAvailable:") a=$2} END{print t,a}' /proc/meminfo)
used=$((mem_total - mem_avail))
mem_pct=$(( (used*100)/mem_total ))

cpu_icon=""
mem_icon=" "
text="${usage}% ${cpu_icon} | ${mem_pct}% ${mem_icon}"

# salida JSON esperada por Waybar
printf '{"text":"%s","tooltip":"CPU: %s%%\\nRAM: %s%%"}\n' "$text" "$usage" "$mem_pct"
