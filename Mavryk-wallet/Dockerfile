
FROM node:22

WORKDIR /app

COPY package*.json ./

RUN npm install colors axios bs58check blakejs @stablelib/ed25519 https-proxy-agent socks-proxy-agent @tzkt/sdk-api @mavrykdynamics/taquito-signer @mavrykdynamics/taquito bip39 ed25519-hd-key --no-fund --no-audit --legacy-peer-deps --force

COPY . .

RUN chmod +x run.sh

EXPOSE 3000

CMD ["node", "tx_meomundep"]
