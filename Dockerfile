FROM node:14.13.0-alpine3.12
LABEL maintainer="DevRel <devrel@mallgroup.com>"
LABEL org.opencontainers.image.source="https://github.com/whoopsmonitor/whoopsmonitor-alert-twilio-sms"
LABEL com.whoopsmonitor.documentation="https://github.com/whoopsmonitor/whoopsmonitor-alert-twilio-sms"
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
