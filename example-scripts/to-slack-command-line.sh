#!/usr/bin/env bash

set -e -o pipefail

if [[ -z "${SLACK_ENDPOINT}" ]]; then
    echo "Please provide your Slack endpoint via environment variable:"
    echo "    SLACK_ENDPOINT=https://your.slack.com/endpoint ./example-scripts/to-slack-command-line.sh"
    exit 1;
fi;

curl --silent -X POST --data-urlencode 'payload={"text": "Hello from CLI!"}' ${SLACK_ENDPOINT} > /dev/null;
