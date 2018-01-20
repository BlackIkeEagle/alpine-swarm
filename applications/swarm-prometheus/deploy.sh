#!/usr/bin/env sh

ADMIN_USER=admin \
    ADMIN_PASSWORD=admin \
    SLACK_URL=https://hooks.slack.com/services/TOKEN \
    SLACK_CHANNEL=devops-alerts \
    SLACK_USER=alertmanager \
    docker stack deploy --compose-file=docker-compose.yml mon

