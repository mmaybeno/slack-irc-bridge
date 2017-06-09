Docker container for [slack-irc](https://github.com/ekmartin/slack-irc)
===

### Installation
```
git clone https://github.com/mmaybeno/slack-irc-bridge
```

### Configuration

Copy `config.json.sample` to `config.json` and edit. Info for config is at [slack-irc](https://github.com/ekmartin/slack-irc) and [node-irc](https://node-irc.readthedocs.io/en/latest/)
```
[
  {
    "nickname": "test",
    "server": "irc.bottest.org",
    "token": "slack_bot_user_OAuth_Access_token",
    "channelMapping": {
      "#slack": "#irc"
    }
  },
  {
    "nickname": "test2",
    "server": "irc.bottest.org",
    "token": "slack_bot_user_OAuth_Access_token2",
    "channelMapping": {
      "#slack": "#irc"
    }
  }
]
```

### Building and running

Build the docker container and run it with path to your config file:

```
docker build -t slack-irc-bridge .
docker run -d --init --restart=always -v /path/to/config/config.json:/slack-irc/config.json slackbridge
```

Info on docker parameters:
```
-d          Run detached
--init      Runs an init for slack-irc-bridge node app, helps running as PID 1 / SIGTERM signals
--restart   Always restart slack-irc-bridge if it exits and on docker engine startup
-v          Mount volume of config file to docker container using full directory path
```

### Based off [slackbridge](https://github.com/caktux/slackbridge/)
