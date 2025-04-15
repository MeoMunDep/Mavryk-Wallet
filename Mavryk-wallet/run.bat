@echo off
title Mavryk Wallet Bot by @MeoMunDep
color 0A

cd %~dp0

echo Checking configuration files...

if not exist configs.json (
    (
        echo {
        echo   "2captchaSolver": {
        echo     "maxCaptchaAttempts": 20,
        echo     "2captchaApiKey": ""
        echo   },
        echo   "walletDelays": [1, 1],
        echo   "restartInterval": 10,
        echo   "maxConcurrentWallets": 200,
        echo   "staking": true,
        echo   "buyToken": {
        echo     "OCEAN": true,
        echo     "MARS1": true,
        echo     "NTBM": true,
        echo     "QUEEN": true,
        echo     "amount": [0.1, 0.2]
        echo   },
        echo   "sellToken": {
        echo     "OCEAN": true,
        echo     "MARS1": true,
        echo     "NTBM": true,
        echo     "QUEEN": true,
        echo     "amount": [0.1, 0.2]
        echo   },
        echo   "createVault": {
        echo     "MVRK": true,
        echo     "USDT": false,
        echo     "amount": [1, 2]
        echo   },
        echo   "depositEarn": {
        echo     "MVRK": true,
        echo     "USDT": false,
        echo     "amount": [10, 20]
        echo   },
        echo   "sendToken": {
        echo     "MVRK": true,
        echo     "USDT": true,
        echo     "mMVRK": true,
        echo     "MVN": true,
        echo     "QUEEN": true,
        echo     "OCEAN": true,
        echo     "MARS1": true,
        echo     "NTBM": true,
        echo     "amount": [0.1, 0.2]
        echo   },
        echo   "sendToInternalAddresses": true,
        echo   "receiverAddresses": [
        echo     "add_your_address_here",
        echo     "add_your_address_here",
        echo     "add_your_address_here",
        echo     "add_your_address_here",
        echo     "add_your_address_here"
        echo   ]
        echo }
    ) > configs.json
)


if not exist package.json (
    echo {> package.json
    echo   "dependencies": {>> package.json
    echo       "@stablelib/ed25519": "^2.0.2",>> package.json
    echo       "axios": "^1.8.4",>> package.json
    echo       "blakejs": "^1.2.1",>> package.json
    echo       "bs58check": "^4.0.0",>> package.json
    echo       "colors": "^1.4.0",>> package.json
    echo       "https-proxy-agent": "^7.0.6",>> package.json
    echo       "socks-proxy-agent": "^8.0.5">> package.json
    echo   },>> package.json
    echo   "type": "module">> package.json
    echo }>> package.json
)

(for %%F in (privateKeys.txt proxies.txt) do (
    if not exist %%F (
        type nul > %%F
        echo Created %%F
    )
))

echo Configuration files checked.

echo Checking dependencies...
if exist "..\node_modules" (
    echo Using node_modules from parent directory...
    cd ..
    CALL npm install colors axios bs58check blakejs @stablelib/ed25519 @mavrykdynamics/beacon-blockchain-substrate @mavrykdynamics/beacon-types @mavrykdynamics/beacon-sdk https-proxy-agent socks-proxy-agent @tzkt/sdk-api @mavrykdynamics/taquito-signer @mavrykdynamics/taquito bip39 ed25519-hd-key --no-fund --no-audit --legacy-peer-deps --force
    cd %~dp0
) else (
    echo Installing dependencies in current directory...
    CALL npm install colors axios bs58check blakejs @stablelib/ed25519 @mavrykdynamics/beacon-types @mavrykdynamics/beacon-sdk https-proxy-agent socks-proxy-agent @tzkt/sdk-api @mavrykdynamics/taquito-signer @mavrykdynamics/taquito bip39 ed25519-hd-key --no-fund --no-audit --legacy-peer-deps --force
)
echo Dependencies installation completed!

echo Starting the bot...
node tx_meomundep

pause
exit
