# 🚀 Mavryk Bot Setup Guide by @Meomundep

<details>
<summary>📱 <strong>Mobile Users (Termux)</strong></summary>

For Android users running Termux, check out the [specialized mobile guide](https://github.com/MeoMunDep/Guides-for-using-my-script-on-termux) for optimized setup instructions.
</details>

---

## 📋 Quick Summary

This automated bot performs multiple Mavryk blockchain operations including:
- **Token Trading**: Buy/sell OCEAN, MARS1, NTBM, QUEEN
- **DeFi Operations**: Create vaults, deposit/borrow tokens
- **Token Management**: Send MVRK, USDT, mMVRK, MVN tokens
- **Staking**: Automated staking functionality
- **Multi-wallet Support**: Concurrent wallet management with proxy support

---

## 📌 Table of Contents

<details>
<summary>Click to expand navigation</summary>

1. [System Requirements](#-system-requirements)
2. [Installation Methods](#-installation-methods)
3. [Configuration Setup](#-configuration-setup)
4. [Running the Bot](#-running-the-bot)
5. [Maintenance](#-maintenance)
6. [Support](#-support)
</details>

---

## 🔧 System Requirements

<details>
<summary>Prerequisites & Downloads</summary>

### Required Software
- **Node.js**: Version `22.11.0` 
- **npm**: Version `10.9.0`
- **Git**: For easy updates
- **Docker**: Optional containerization

### Download Links
- 📥 [Node.js & npm](https://t.me/KeoAirDropFreeNe/257/1462)
- 📥 [Git](https://t.me/KeoAirDropFreeNe/257/60831)
- 📥 [Docker Installation Guide](https://t.me/KeoAirDropFreeNe/257/60831)
</details>

---

## 📦 Installation Methods

<details>
<summary>🔹 Method 1: Git Installation (Recommended)</summary>

```bash
# Clone repository
git clone https://github.com/MeoMunDep/mavryk-wallet.git
cd mavryk-wallet/mavryk-wallet

# Install dependencies
npm install
```
</details>

<details>
<summary>🔹 Method 2: Manual Installation</summary>

1. Download bot files manually from GitHub
2. Extract to desired folder
3. Open terminal in bot directory
4. Run: `npm install`
</details>

<details>
<summary>🔹 Method 3: Docker Installation</summary>

```bash
# Build image
docker build -t mavryk-wallet-image .

# Run container
docker run -d --name mavryk-wallet-container mavryk-wallet-image
```
</details>

---

## ⚙️ Configuration Setup

<details>
<summary>📜 <strong>configs.json</strong> - Main Configuration</summary>

```json
{
  "2captchaSolver": {
    "maxCaptchaAttempts": 20,
    "2captchaApiKey": ""
  },
  "walletDelays": [1, 1],
  "restartInterval": 300,
  "maxConcurrentWallets": 10,
  "staking": true,
  "buyToken": {
    "OCEAN": false,
    "MARS1": false,
    "NTBM": false,
    "QUEEN": false,
    "amount": [0.1, 0.2]
  },
  "sellToken": {
    "OCEAN": false,
    "MARS1": false,
    "NTBM": false,
    "QUEEN": false,
    "amount": [0.1, 0.2]
  },
  "createVault": {
    "MVRK": true,
    "USDT": true,
    "amount": [1, 2]
  },
  "depositToken": true,
  "borrowToken": true,
  "sendToken": {
    "MVRK": true,
    "USDT": true,
    "mMVRK": true,
    "MVN": true,
    "QUEEN": false,
    "OCEAN": false,
    "MARS1": false,
    "NTBM": false,
    "amount": [0.1, 0.2]
  },
  "sendToInternalAddresses": true,
  "receiverAddresses": [
    "add_your_wallet_here",
    "add_your_wallet_here",
    "add_your_wallet_here",
    "add_your_wallet_here",
    "add_your_wallet_here"
  ]
}
```

### 🔧 Configuration Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `2captchaSolver.maxCaptchaAttempts` | number | 20 | Max CAPTCHA solve attempts |
| `2captchaSolver.2captchaApiKey` | string | "" | Your 2Captcha API key |
| `walletDelays` | [number, number] | [5, 8] | Random delay between wallets (seconds) |
| `restartInterval` | number | 300 | Bot restart interval (seconds) |
| `maxConcurrentWallets` | number | 100 | Simultaneous wallet limit |
| `staking` | boolean | false | Enable/disable staking |
| `createVault.MVRK/USDT` | boolean | false | Create specific token vaults |
| `createVault.amount` | [number, number] | [1, 2] | Vault creation amount range |
| `depositToken` | boolean | false | Auto-deposit after vault creation |
| `borrowToken` | boolean | false | Auto-borrow against vault |
| `sendToken.*` | boolean | varies | Enable token sending |
| `sendToken.amount` | [number, number] | [1, 2] | Token send amount range |
| `sendToInternalAddresses` | boolean | true | Send to bot-managed addresses |
| `receiverAddresses` | array | [] | Destination wallet addresses |
</details>

<details>
<summary>🗂️ <strong>privateKeys.txt</strong> - Wallet Private Keys</summary>

Add your Mavryk private keys (one per line):
```txt
edsk...
edsk...
edsk...
```

📝 [Generate wallets automatically](https://github.com/MeoMunDep/Automatic-Ultimate-Create-Wallets-for-Airdrop)
</details>

<details>
<summary>🌐 <strong>proxies.txt</strong> - Proxy Configuration (Optional)</summary>

Supported formats:
```txt
http://host:port
https://host:port
socks4://host:port
socks5://host:port
http://user:pass@host:port
https://user:pass@host:port
socks4://user:pass@host:port
socks5://user:pass@host:port
```

🔗 [Get reliable proxies](https://www.webshare.io/?referral_code=4l5kb3glsce7)
</details>

---

## 🚀 Running the Bot

<details>
<summary>💻 <strong>Standard Execution</strong></summary>

### Command Line
```bash
node tx_meomundep.js
```

### Windows Batch Script
```cmd
cd "path\to\mavryk-wallet"
run.bat
```
*Run as Administrator if permission issues occur*

### Linux/macOS Shell Script
```bash
./run.sh
```
</details>

<details>
<summary>🐳 <strong>Docker Execution</strong></summary>

```bash
# Start container
docker start mavryk-wallet-container

# View logs
docker logs mavryk-wallet-container

# Stop container
docker stop mavryk-wallet-container
```
</details>

---

## 🔄 Maintenance

<details>
<summary>📥 <strong>Updating the Bot</strong></summary>

### Git Method
```bash
cd mavryk-wallet
git pull origin main
npm install
```

### Docker Method
```bash
docker stop mavryk-wallet-container
docker rm mavryk-wallet-container
docker build -t mavryk-wallet-image .
docker run -d --name mavryk-wallet-container mavryk-wallet-image
```
</details>

<details>
<summary>🛠️ <strong>Troubleshooting</strong></summary>

### Common Issues
- **Permission Errors**: Run as Administrator (Windows) or use `sudo` (Linux/macOS)
- **Port Conflicts**: Check if ports are already in use
- **Network Issues**: Verify proxy settings and internet connection
- **CAPTCHA Failures**: Check 2Captcha API key and balance

### Performance Optimization
- Adjust `maxConcurrentWallets` based on system resources
- Increase `walletDelays` if rate-limited
- Use quality proxies for better success rates
</details>

---

## 📞 Support

<details>
<summary>🔗 <strong>Resources & Contact</strong></summary>

### Official Links
- 🌐 [Mavryk Wallet Extension](https://chromewebstore.google.com/detail/mavryk-wallet/cgddkajmbckbjbnondgfcbcojjjdnmji)
- 🎯 [Galxe Quests](https://app.galxe.com/quest/YxQGYqYQcCGDcfX7KZMU8j/GCsVgt1rUx?referral_code=GRFr2JwrrimuEzutJsPOIO4qJbReP6jzWa-sC-le8jxo2H8)
- 💧 [Faucet Trick](https://t.me/KeoAirDropFreeNee/1651)

### Community & Support
- 💬 [Developer Contact](https://t.me/MeoMunDep)
- 👥 [Support Group](https://t.me/KeoAirDropFreeNe)
- 📢 [Updates Channel](https://t.me/KeoAirDropFreeNee)
- 🛒 [Telegram Accounts](https://t.me/KeoAirDropFreeNe/312/27801)
</details>

---

## ⚠️ Disclaimer

<details>
<summary>Legal Notice</summary>

This code is provided "as is" without warranties. Users assume full responsibility for consequences. Redistribution or commercial sale is prohibited.
</details>

