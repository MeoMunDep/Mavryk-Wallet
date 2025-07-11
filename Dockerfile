FROM node:22

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

RUN chmod +x run.sh

EXPOSE 3000

CMD ["node", "tx_meomundep"]
