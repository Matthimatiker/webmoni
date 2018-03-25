#!/usr/bin/env bash

# Stop on failure
set -e -o pipefail

if [[ -z "${SLACK_ENDPOINT}" ]]; then
    echo "Please provide your Slack endpoint via environment variable:"
    echo "    SLACK_ENDPOINT=https://your.slack.com/endpoint ./example-scripts/to-slack-pipe.sh"
    exit 1;
fi;

to_slack() {
    line=$(echo $1 | php -r "echo json_encode(stream_get_contents(STDIN));");
    curl --silent -X POST --data-urlencode 'payload={"text": '"${line}"'}' ${SLACK_ENDPOINT} > /dev/null;
}

to_slack "Start pipe Demo!"

# The "echo" is just an example: You can pipe content from any command line tool directly into Slack.
echo "This...
is...
Output!" 2>&1 | while read -r line; do to_slack "${line}"; done
