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
        echo     "OCEAN": false,
        echo     "MARS1": false,
        echo     "NTBM": false,
        echo     "QUEEN": false,
        echo     "amount": [0.1, 0.2]
        echo   },
        echo   "sellToken": {
        echo     "OCEAN": false,
        echo     "MARS1": false,
        echo     "NTBM": false,
        echo     "QUEEN": false,
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
        echo     "QUEEN": false,
        echo     "OCEAN": false,
        echo     "MARS1": false,
        echo     "NTBM": false,
        echo     "amount": [0.1, 0.2]
        echo   },
        echo   "sendToInternalAddresses": true,
        echo   "receiverAddresses": [
        echo     "add_your_addresses_here",
        echo     "add_your_addresses_here",
        echo     "add_your_addresses_here",
        echo     "add_your_addresses_here",
        echo     "add_your_addresses_here"
        echo   ]
        echo }
    ) > configs.json
)

(for %%F in (privateKeys.txt proxies.txt Dockerfile docker-compole.yml) do (
    if not exist %%F (
        type nul > %%F
        echo Created %%F
    )
))

echo Configuration files checked.

echo Starting the bot, wait a few minutes to download all necessary things...
node tx_meomundep

pause
exit
