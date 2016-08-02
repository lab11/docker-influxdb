#!/bin/bash

set -m

# Generate self-signed certificate for HTTPS testing for CI
echo "=> [CI] Generate self-signed certificate"
CI_CERT_PEM="/ci_cert.pem"
SUBJECT_STRING="/C=US/ST=NewYork/L=NYC/O=CIBuild/CN=*"
openssl req -new -newkey rsa:4096 -days 3650 -nodes -x509 -subj ${SUBJECT_STRING} -keyout /server.key -out /server.crt >/dev/null 2>&1
cat /server.key /server.crt > ${CI_CERT_PEM}
rm -f /server.key /server.crt

./run.http.sh &
sleep 5s
./run.https.sh &
sleep 5s
./run.https.httpauth.sh &

fg
