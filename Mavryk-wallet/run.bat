@echo off
title Mavryk Wallet Bot by @MeoMunDep
color 0A

cd %~dp0

echo Checking configuration files...

if not exist configs.json (
    echo {> configs.json
    echo   "walletDelays": [1, 1],>> configs.json
    echo   "restartInterval": 10,>> configs.json
    echo   "maxConcurrentWallets": 200,>> configs.json
    echo   "staking": false,>> configs.json
    echo   "createVault": {>> configs.json
    echo       "USDT": true,>> configs.json
    echo       "MVRK": true,>> configs.json
    echo       "amount": [1, 2]>> configs.json
    echo   },>> configs.json
    echo   "depositToken": true,>> configs.json
    echo   "borrowToken": true,>> configs.json
    echo   "sendToken": {>> configs.json
    echo       "USDT": true,>> configs.json
    echo       "mMVRK": true,>> configs.json
    echo       "MVN": true,>> configs.json
    echo       "amount": [1, 2]>> configs.json
    echo   },>> configs.json
    echo   "sendToInternalAddresses": true,>> configs.json
    echo   "receiverAddresses": ["mv1LkTHEzHJ3pRw159Qv6Q2We4EyTH6RgS2X"]>> configs.json
    echo }>> configs.json
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
    CALL npm install colors axios bs58check blakejs @stablelib/ed25519 https-proxy-agent socks-proxy-agent @mavrykdynamics/taquito-signer @mavrykdynamics/taquito @tzkt/sdk-api --no-fund --no-audit --legacy-peer-deps --force
    cd %~dp0
) else (
    echo Installing dependencies in current directory...
    CALL npm install colors axios bs58check blakejs @stablelib/ed25519 https-proxy-agent socks-proxy-agent @mavrykdynamics/taquito-signer @mavrykdynamics/taquito @tzkt/sdk-api --no-fund --no-audit --legacy-peer-deps --force
)
echo Dependencies installation completed!

echo Starting the bot...
node meomundep_v1

pause
exit
