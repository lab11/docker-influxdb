#!/bin/bash

echo "=> !! CI BUILD :: HTTPS+HTTPAUTH !!"

export CONFIG_FILE="/config/config.https.httpauth.toml"
export INFLUX_HOST="localhost"
export INFLUX_API_PORT="9085"
export API_URL="https://${INFLUX_HOST}:${INFLUX_API_PORT}"

./run.common.sh
