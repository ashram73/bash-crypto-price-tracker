# bash-crypto-price-tracker

A simple Bash script to fetch and log cryptocurrency prices (via the free CoinGecko API), and optionally alert you when prices cross thresholds.

## Features

- Fetch prices for one or more coins (bitcoin, ethereum, etc.)
- Log timestamps & prices to per‐coin CSV files under `logs/`
- Support for price alerts
- Easy configuration via `config.sh` or environment variables

## Prerequisites

- `bash`, `curl`, `jq`, `bc`, `date`
- Internet connection

## Setup

1. Clone this repo:

   ```bash
   git clone https://github.com/yourusername/bash-crypto-price-tracker.git
   cd bash-crypto-price-tracker

2-Copy configuration:
  cp .env.sample .env

  
3-Make scripts executable:

    chmod +x crypto_tracker.sh config.sh


