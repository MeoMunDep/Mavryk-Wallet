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
   npm install --force user-agents axios colors https-proxy-agent socks-proxy-agent 
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
  "amountToSendMVRK": 10,
  "receiverAddresses": [""]
}

```

Explanation of each parameter:

| **Parameter Name**            | **Data Type**      | **Default Value** | **Description**                                                                   |
| ----------------------------- | ------------------ | ----------------- | --------------------------------------------------------------------------------- |
| `walletDelays`            | `[number, number]` | `[5, 8]`          | Random delay (in seconds) between wallets when performing tasks.                 |
| `restartInterval`    | `number`           | `300`             | Time (in seconds) before the bot restarts all wallets.                           |
| `maxConcurrentWallets` | `number`           | `100`             | Number of wallets running simultaneously.                                        |
| `amountToSendMVRK`                     | `number`          | `10`            | Amount of MVRK to receive.        |
| `receiverAddresses`                   | `string`          | `true`            | Addresses list to receive tokens.                                            |

Would you like me to add instructions on how users can adjust `configs.json` based on their needs? 🚀

### 2. `privateKeys.txt` - 🗂️ Wallet Privatekey

- [Get it from here](https://github.com/MeoMunDep/Automatic-Ultimate-Create-Wallets-for-Airdrop)

```txt

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

- **Mavryk Website** [Wallet Extension Link](https://chromewebstore.google.com/detail/mavryk-wallet/cgddkajmbckbjbnondgfcbcojjjdnmji) | [Galxe quests](https://app.galxe.com/quest/YxQGYqYQcCGDcfX7KZMU8j/GCC9vt1ZLg)
- **Buy a Telegram account** [Here](https://t.me/KeoAirDropFreeNe/312/27801)
- **Contact for work:** [Telegram](https://t.me/MeoMunDep)
- **Join the support group:** [Join here](https://t.me/KeoAirDropFreeNe)
- **Updates Channel:** [View channel](https://t.me/KeoAirDropFreeNee)

⚠️ **Disclaimer**: This code is provided "as is" without any warranties. Use it at your own risk. You are solely responsible for any consequences arising from its use. Redistribution or sale of this code in any form is strictly prohibited.

✨ Thank you for using the bot! Good luck! 🚀
