#!/bin/bash

echo "=> !! CI BUILD :: HTTPS !!"

export CONFIG_FILE="/config/config.https.toml"
export INFLUX_HOST="localhost"
export INFLUX_API_PORT="8085"
export API_URL="https://${INFLUX_HOST}:${INFLUX_API_PORT}"

./run.common.sh
