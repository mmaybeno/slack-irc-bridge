FROM node:8-alpine

# Get slack-irc
RUN npm install -g slack-irc

USER node

CMD ["slack-irc", "--config", "slack-irc/config.json"]
