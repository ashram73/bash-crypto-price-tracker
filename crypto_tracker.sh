#!/usr/bin/env bash
set -euo pipefail

# Load config
source "$(dirname "$0")/config.sh"

# Dependencies check
for cmd in curl jq date; do
  command -v "$cmd" >/dev/null 2>&1 || {
    echo >&2 "Error: '$cmd' is required but not installed."
    exit 1
  }
done

# Prepare log directory
mkdir -p "$LOG_DIR"

# Get timestamp
TS=$(date --iso-8601=seconds)

# Fetch prices
API="https://api.coingecko.com/api/v3/simple/price"
RESP=$(curl -s --get "$API" \
  --data-urlencode "ids=$COINS" \
  --data-urlencode "vs_currencies=$VS_CURRENCY")

# Parse & log
for coin in ${COINS//,/ }; do
  price=$(jq -r --arg coin "$coin" ".[$coin].$VS_CURRENCY" <<<"$RESP")
  logfile="$LOG_DIR/${coin}_prices.csv"
  if [[ ! -f "$logfile" ]]; then
    echo "timestamp,price" > "$logfile"
  fi
  echo "$TS,$price" >> "$logfile"

  # Alert?
  threshold=${ALERT_THRESHOLDS[$coin]:-}
  if [[ -n "$threshold" ]] && (( $(echo "$price > $threshold" | bc -l) )); then
    echo "⚠️  Alert: $coin price is \$$price (>$threshold)"
  fi
done
