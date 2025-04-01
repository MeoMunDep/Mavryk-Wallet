#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' 

echo -ne "\033]0;Mavryk Wallet Bot by @MeoMunDep\007"


print_green() {
    echo -e "${GREEN}$1${NC}"
}

print_yellow() {
    echo -e "${YELLOW}$1${NC}"
}

print_red() {
    echo -e "${RED}$1${NC}"
}

chmod +x "$0"

if [ -d "../node_modules" ]; then
    print_green "Found node_modules in parent directory"
    MODULES_DIR=".."
else
    print_green "Using current directory for node_modules"
    MODULES_DIR="."
fi

create_default_configs() {
    cat > configs.json << EOL
"walletDelays": [1, 1],
  "restartInterval": 10,
  "maxConcurrentWallets": 200,

  "staking": false,
  "createToken": true,

  "sendToken": {
    "USDT": true,
    "mMVRK": true,
    "MVN": true,
    "amount": [1, 2]
  },

  "sendToInternalAddresses": true,
  "receiverAddresses": []
}
EOL
}

check_configs() {
    if ! node -e "try { const cfg = require('./configs.json'); if (!cfg.maxConcurrentWallets || typeof cfg.maxConcurrentWallets !== 'number' || cfg.maxConcurrentWallets < 1) throw new Error(); } catch { process.exit(1); }"; then
        print_red "Invalid configuration detected. Resetting to default values..."
        create_default_configs
        print_green "Configuration reset completed."
    fi
}

print_yellow "Checking configuration files..."
if [ ! -f configs.json ]; then
    create_default_configs
    print_green "Created configs.json with default values"
fi

check_configs

for file in privateKeys.txt proxies.txt; do
    if [ ! -f "$file" ]; then
        touch "$file"
        print_green "Created $file"
    fi
done

print_green "Configuration files have been checked."

print_yellow "Checking dependencies..."
cd "$MODULES_DIR"
npm install colors axios bs58check blakejs @stablelib/ed25519 https-proxy-agent socks-proxy-agent --no-fund --no-audit --legacy-peer-deps --force
cd - > /dev/null
print_green "Dependencies installation completed!"

print_green "Starting the bot..."
node meomundep
