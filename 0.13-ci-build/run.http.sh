#!/bin/bash

echo "=> !! CI BUILD :: HTTP !!"

export CONFIG_FILE="/config/config.http.toml"
export INFLUX_HOST="localhost"
export INFLUX_API_PORT="8086"
export API_URL="http://${INFLUX_HOST}:${INFLUX_API_PORT}"

./run.common.sh
