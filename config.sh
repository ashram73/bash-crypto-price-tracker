#!/usr/bin/env bash
#
# Configuration for crypto_tracker.sh

# Which coins to track (CoinGecko IDs, comma‐separated)
COINS="bitcoin,ethereum"

# Fiat currency
VS_CURRENCY="usd"

# Where to store log files (will be created if missing)
LOG_DIR="./logs"

# Alert thresholds: declare an associative array [coin]=price
# e.g. ALERT_THRESHOLDS=( ["bitcoin"]=60000 ["ethereum"]=4000 )
declare -A ALERT_THRESHOLDS=()
