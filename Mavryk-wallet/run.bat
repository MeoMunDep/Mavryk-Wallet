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
    echo   "createToken": true,>> configs.json
    echo   "sendToken": {>> configs.json
    echo       "USDT": true,>> configs.json
    echo       "mMVRK": true,>> configs.json
    echo       "MVN": true,>> configs.json
    echo       "amount": [1, 2]>> configs.json
    echo   },>> configs.json
    echo   "sendToInternalAddresses": true,>> configs.json
    echo   "receiverAddresses": []>> configs.json
    echo }>> configs.json
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
    CALL npm install colors axios bs58check blakejs @stablelib/ed25519 https-proxy-agent socks-proxy-agent --no-fund --no-audit --legacy-peer-deps --force
    cd %~dp0
) else (
    echo Installing dependencies in current directory...
    CALL npm install colors axios bs58check blakejs @stablelib/ed25519 https-proxy-agent socks-proxy-agent --no-fund --no-audit --legacy-peer-deps --force
)
echo Dependencies installation completed!

echo Starting the bot...
node meomundep

pause
exit
