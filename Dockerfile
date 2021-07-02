FROM node:14.13.0-alpine3.12
LABEL maintainer="Daniel Rataj <daniel.rataj@centrum.cz>"
LABEL org.opencontainers.image.source="https://github.com/whoopsmonitor/whoopsmonitor-alert-twilio-sms"
LABEL com.whoopsmonitor.documentation="https://github.com/whoopsmonitor/whoopsmonitor-alert-twilio-sms"
LABEL com.whoopsmonitor.icon="data:image/svg+xml;base64,PHN2ZyBmaWxsPSIjRjIyRjQ2IiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAzMCAzMCI+PHBhdGggZD0iTTE1IDBDNi43IDAgMCA2LjcgMCAxNXM2LjcgMTUgMTUgMTUgMTUtNi43IDE1LTE1UzIzLjMgMCAxNSAwem0wIDI2QzguOSAyNiA0IDIxLjEgNCAxNVM4LjkgNCAxNSA0czExIDQuOSAxMSAxMS00LjkgMTEtMTEgMTF6bTYuOC0xNC43YzAgMS43LTEuNCAzLjEtMy4xIDMuMXMtMy4xLTEuNC0zLjEtMy4xIDEuNC0zLjEgMy4xLTMuMSAzLjEgMS40IDMuMSAzLjF6bTAgNy40YzAgMS43LTEuNCAzLjEtMy4xIDMuMXMtMy4xLTEuNC0zLjEtMy4xYzAtMS43IDEuNC0zLjEgMy4xLTMuMXMzLjEgMS40IDMuMSAzLjF6bS03LjQgMGMwIDEuNy0xLjQgMy4xLTMuMSAzLjFzLTMuMS0xLjQtMy4xLTMuMWMwLTEuNyAxLjQtMy4xIDMuMS0zLjFzMy4xIDEuNCAzLjEgMy4xem0wLTcuNGMwIDEuNy0xLjQgMy4xLTMuMSAzLjFTOC4yIDEzIDguMiAxMS4zczEuNC0zLjEgMy4xLTMuMSAzLjEgMS40IDMuMSAzLjF6Ii8+PC9zdmc+Cg=="
LABEL com.whoopsmonitor.env.WM_TWILIO_ACCOUNT_SID="Your Account SID from www.twilio.com/console"
LABEL com.whoopsmonitor.env.WM_TWILIO_AUTH_TOKEN="Your Auth Token from www.twilio.com/console"
LABEL com.whoopsmonitor.env.WM_TWILIO_FROM="+"
LABEL com.whoopsmonitor.env.WM_TWILIO_TO="+"

WORKDIR /app
COPY ./src/index.js ./index.js
COPY ./src/package.json ./package.json
COPY ./src/package-lock.json ./package-lock.json

RUN npm install

CMD [ "npm", "start", "--silent" ]
