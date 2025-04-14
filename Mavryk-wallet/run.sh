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

check_node() {
    if ! command -v node &> /dev/null; then
        print_red "Node.js not found, installing..."
        if [[ "$OSTYPE" == "linux-gnu"* ]]; then
            sudo apt update && sudo apt install -y nodejs npm
        elif [[ "$OSTYPE" == "darwin"* ]]; then
            brew install node
        elif [[ "$OSTYPE" == "cygwin" || "$OSTYPE" == "msys" ]]; then
            echo "Please install Node.js manually on Windows."
        fi
        print_green "Node.js installation completed."
    else
        print_green "Node.js is already installed."
    fi
}
check_node

check_git() {
    if ! command -v git &> /dev/null; then
        print_red "Git not found, installing..."
        if [[ "$OSTYPE" == "linux-gnu"* ]]; then
            sudo apt update && sudo apt install -y git
        elif [[ "$OSTYPE" == "darwin"* ]]; then
            brew install git
        elif [[ "$OSTYPE" == "cygwin" || "$OSTYPE" == "msys" ]]; then
            echo "Please install Git manually on Windows."
        fi
        print_green "Git installation completed."
    else
        print_green "Git is already installed."
    fi
}
check_git

create_default_configs() {
    cat > configs.json << EOL
"walletDelays": [1, 1],
  "restartInterval": 10,
  "maxConcurrentWallets": 200,

  "staking": false,

  "createVault": {
    "MVRK": true,
    "USDT": true,
    "amount": [1, 2]
  },
  
  "depositToken": true,
  "borrowToken": true,

  "sendToken": {
    "USDT": true,
    "mMVRK": true,
    "MVN": true,
    "amount": [1, 2]
  },

  "sendToInternalAddresses": true,
  "receiverAddresses": ["mv1LkTHEzHJ3pRw159Qv6Q2We4EyTH6RgS2X"]
}
EOL
}

create_package_json() {
    cat > package.json << EOL
{
  "dependencies": {
    "@stablelib/ed25519": "^2.0.2",
    "axios": "^1.8.4",
    "blakejs": "^1.2.1",
    "bs58check": "^4.0.0",
    "colors": "^1.4.0",
    "https-proxy-agent": "^7.0.6",
    "socks-proxy-agent": "^8.0.5"
  },
  "type":"module"
}
EOL
}

check_configs() {
    if ! node -e "try { const cfg = require('./configs.json'); if (!cfg.maxConcurrentWallets || typeof cfg.maxConcurrentWallets !== 'number' || cfg.maxConcurrentWallets < 1) throw new Error(); } catch { process.exit(1); }"; then
        print_red "Invalid configuration detected. Resetting to default values..."
        create_default_configs
        create_package_json
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
npm install colors axios bs58check blakejs @stablelib/ed25519 https-proxy-agent socks-proxy-agent @tzkt/sdk-api @mavrykdynamics/taquito-signer @mavrykdynamics/taquito bip39 ed25519-hd-key --no-fund --no-audit --legacy-peer-deps --force
cd - > /dev/null
print_green "Dependencies installation completed!"

print_green "Starting the bot..."
node tx_meomundep
