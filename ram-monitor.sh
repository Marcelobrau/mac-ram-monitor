#!/bin/zsh
# Monitora a RAM do macOS: top processos por memória + memória livre + pageouts.
# Uso: ./ram-monitor.sh [amostras=10] [intervalo_seg=30] [arquivo_saida=ram-monitor.log]
samples=${1:-10}
interval=${2:-30}
out=${3:-ram-monitor.log}

for ((i = 1; i <= samples; i++)); do
  echo "== $(date +%H:%M:%S)" >> "$out"
  ps -Ao pid,rss,comm \
    | awk 'NR>1 { n=$3; sub(/.*\//, "", n); print $1, int($2/1024) " MB", n }' \
    | sort -k2 -nr | head -8 >> "$out"
  vm_stat | awk '/Pages free/ {f=$3} /Pageouts/ {p=$2} END {printf "free_pages=%s pageouts=%s\n", f, p}' >> "$out"
  (( i < samples )) && sleep "$interval"
done
echo "DONE" >> "$out"
