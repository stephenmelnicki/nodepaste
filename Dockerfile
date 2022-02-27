FROM node:lts-alpine@sha256:2c6c59cf4d34d4f937ddfcf33bab9d8bbad8658d1b9de7b97622566a52167f2b

RUN apk add dumb-init
ENV NODE_ENV production

USER node
WORKDIR /home/node/nodepaste

COPY --chown=node:node package*.json .
RUN npm ci --only=production

COPY --chown=node:node . .

CMD ["dumb-init", "node", "server.js"]
EXPOSE 3000
