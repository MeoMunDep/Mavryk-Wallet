### 🚀 Bot Setup Guide

Welcome to the bot setup guide! Follow the steps below to install and configure the bot correctly. This guide is designed for new users, with clear explanations for each step.

> 📱 **For Mobile Users (Termux):** [View the guide here](https://github.com/MeoMunDep/Guides-for-using-my-script-on-termux)

---

## 📌 Table of Contents

1. [System Requirements](#system-requirements)
2. [Installing the Bot](#installing-the-bot)
   - [Install via Git](#install-via-git)
   - [Manual Installation](#manual-installation)
   - [Install via Docker](#install-via-docker)
3. [Bot Configuration](#bot-configuration)
   - [`configs.json`](#1-configsjson)
   - [`privateKeys.txt`](#4-privateKeystxt)
   - [`proxies.txt`](#3-proxiestxt)
4. [Running the Bot](#running-the-bot)
5. [Updating the Bot](#updating-the-bot)
6. [Contact & Support](#contact-support)

---

## 📌 System Requirements

Before running the bot, make sure you have installed:

- **Node.js** (Version: `22.11.0`)
- **npm** (Version: `10.9.0`)
- **Git** (For downloading and updating the bot easily)
- **Docker** _(Optional: If you want to run the bot in a container)_

📥 **Download Node.js and npm here:** [Download Link](https://t.me/KeoAirDropFreeNe/257/1462).
📥 **Download Git here:** [Download Link](https://t.me/KeoAirDropFreeNe/257/60831).

---

## 📌 Installing the Bot

### 🔹 Install via Git

1. **Download the bot**:
   ```bash
   git clone https://github.com/MeoMunDep/mavryk-wallet.git
   cd mavryk-wallet/mavryk-wallet
   ```
2. **Install required libraries**:
   ```bash
   npm install colors axios bs58check blakejs @stablelib/ed25519 https-proxy-agent socks-proxy-agent --no-fund --no-audit --legacy-peer-deps --force
   ```
3. **Prepare configuration files** ([See details](#bot-configuration))

### 🔹 Manual Installation (Without Git)

1. **Download and extract the bot** into a folder on your computer.
2. **Install required libraries** (same as Step 2 above).

### 🔹 Install via Docker

1. **Install Docker** if you haven’t already: [Docker Installation Guide](https://t.me/KeoAirDropFreeNe/257/60831).
2. **Build and run the bot using Docker**:
   ```bash
   docker build -t mavryk-wallet-image .
   docker run -d --name mavryk-wallet-container -v $(pwd)/logs:/app/logs mavryk-wallet-image
   ```
   **For Windows CMD:** Use `%cd%` instead of `$(pwd)`.

---

## 📌 Bot Configuration

### 1. `configs.json` - 📜 Main Configuration

```json
{
  "walletDelays": [1, 1],
  "restartInterval": 300,
  "maxConcurrentWallets": 10,

  "staking": false,
  "createToken": true,

  "sendToken": {
    "USDT": true,
    "mMVRK": true,
    "MVN": true,
    "amount": [1, 2]
}

  "sendToInternalAddresses": true,
  "receiverAddresses": ["mv1LkTHEzHJ3pRw159Qv6Q2We4EyTH6RgS2X"]

}

```

Explanation of each parameter:

Dưới đây là bảng đầy đủ với hướng dẫn chi tiết cho các tham số trong file `config.json` mà bạn cung cấp:

| **Parameter Name**            | **Data Type**      | **Default Value** | **Description**                                                                   |
| ----------------------------- | ------------------ | ----------------- | --------------------------------------------------------------------------------- |
| `walletDelays`            | `[number, number]` | `[5, 8]`          | Random delay (in seconds) between wallets when performing tasks. |
| `restartInterval`    | `number`           | `300`             | Time (in seconds) before the bot restarts all wallets. |
| `maxConcurrentWallets` | `number`           | `100`             | Number of wallets running simultaneously.  |
| `staking`                     | `boolean`          | `false`           | Determines whether staking is enabled.  |
| `createToken`                  | `boolean`          | `true`            | Defines whether the bot should create tokens. |
| `sendToken`                   | `object`           | N/A               | Contains settings for which tokens should be sent.  |
| `sendToken.USDT`              | `boolean`          | `true`            | Whether to send USDT. |
| `sendToken.mMVRK`             | `boolean`          | `true`            | Whether to send mMVRK.  |
| `sendToken.MVN`               | `boolean`          | `true`            | Whether to send MVN.  |
| `sendToken.amount`            | `[number, number]` | `[1, 2]`          | Range of the amount of tokens to send (in specified tokens).  |
| `sendToInternalAddresses`     | `boolean`          | `true`            | Whether to send tokens to internal addresses.  |
| `receiverAddresses`           | `array of string`  | N/A               | List of receiver addresses. |


### 2. `privateKeys.txt` - 🗂️ Wallet Privatekey

- [Get it from here](https://github.com/MeoMunDep/Automatic-Ultimate-Create-Wallets-for-Airdrop)
- Mavryk privatekey.

```txt
edsk...
edsk...
edsk...
```

### 3. `proxies.txt` - 🌐 Proxy (Optional)

- [Get it from here](https://www.webshare.io/?referral_code=4l5kb3glsce7)

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

---

## 📌 Running the Bot

### **Run on PC:**

```bash
node meomundep.js
```

### **Run with batch script on Windows:**

1. Open **Command Prompt (CMD)**.
2. Navigate to the bot folder:
   ```cmd
   cd "path\to\mavryk-wallet"
   ```
3. Run the batch script:
   ```cmd
   run.bat
   ```
   _(\*If you encounter permission issues, right-click `run.bat` and select "Run as Administrator".)_

### **Run with shell script on Linux/macOS:**

```bash
./run.sh
```

### **Run using Docker:**

```bash
docker start mavryk-wallet-container
```

---

## 📌 Updating the Bot

### 🔹 If installed via Git

```bash
cd mavryk-wallet
git pull origin main
npm install
```

### 🔹 If running via Docker

```bash
docker stop mavryk-wallet-container
docker rm mavryk-wallet-container
docker build -t mavryk-wallet-image .
docker run -d --name mavryk-wallet-container -v $(pwd)/logs:/app/logs mavryk-wallet-image
```

_For Windows CMD:_

```cmd
docker run -d --name mavryk-wallet-container -v %cd%\logs:/app/logs mavryk-wallet-image
```

---

## 📌 Contact & Support

- **Mavryk Website** [Wallet Extension Link](https://chromewebstore.google.com/detail/mavryk-wallet/cgddkajmbckbjbnondgfcbcojjjdnmji) | [Galxe quests](https://app.galxe.com/quest/YxQGYqYQcCGDcfX7KZMU8j/GCsVgt1rUx?referral_code=GRFr2JwrrimuEzutJsPOIO4qJbReP6jzWa-sC-le8jxo2H8) | [Faucet Trick](https://t.me/KeoAirDropFreeNee/1651)
- **Buy a Telegram account** [Here](https://t.me/KeoAirDropFreeNe/312/27801)
- **Contact for work:** [Telegram](https://t.me/MeoMunDep)
- **Join the support group:** [Join here](https://t.me/KeoAirDropFreeNe)
- **Updates Channel:** [View channel](https://t.me/KeoAirDropFreeNee)

⚠️ **Disclaimer**: This code is provided "as is" without any warranties. Use it at your own risk. You are solely responsible for any consequences arising from its use. Redistribution or sale of this code in any form is strictly prohibited.

✨ Thank you for using the bot! Good luck! 🚀
