
FROM node:22

WORKDIR /app

COPY package*.json ./

RUN npm install colors axios bs58check blakejs @stablelib/ed25519 https-proxy-agent socks-proxy-agent --no-fund --no-audit --legacy-peer-deps --force

COPY . .

RUN mkdir -p logs

RUN chmod +x start.sh

EXPOSE 3000

CMD ["node", "meomundep"]
