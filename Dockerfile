FROM node:latest AS build

WORKDIR /usr/src/nodepaste

COPY --chown=node:node package*.json .
RUN npm ci --only=production

FROM node:lts-alpine@sha256:2c6c59cf4d34d4f937ddfcf33bab9d8bbad8658d1b9de7b97622566a52167f2b

RUN apk add dumb-init
ENV NODE_ENV production

USER node
WORKDIR /home/node/nodepaste

COPY --chown=node:node --from=build /usr/src/nodepaste/node_modules /home/node/nodepaste/node_modules
COPY --chown=node:node . .

EXPOSE 3000
CMD ["dumb-init", "node", "index.js"]
