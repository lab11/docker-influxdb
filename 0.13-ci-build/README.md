CI Build
========

The CI Build variant is designed to facilitate continuous integration testing.
It differs from the main build by:

 - Automatically generating a self-signed SSL certificate
 - Disable metrics reporting
 - Run a normal instance of influxdb [same as main build]
    - admin API on 8083 [default]
    - http API on 8086 [default]
    - cluster config on 8088 [default]
 - Run a second instance of influxdb
    - admin API on 8085 [default]
    - https API on 8084 [default]
    - cluster config on 8087
 - Run a third instance of influxdb with https and http auth enabled
    - admin API on 9085
    - https API on 9084
    - cluster config on 9087

You should not use the CI build in production systems, it is subject to change
at any time to match CI needs.


Executing
---------

    docker run -d -p 8083:8083 -p 8086:8086 -p 8085:8085 -p 8084:8084 -p 9085:9085 -p 9084:9084 --expose 8090 --expose 8099 lab11/docker-influxdb:latest-ci


Building Docker Images
----------------------

    docker build -t lab11/docker-influxdb:0.13-ci -t lab11/docker-influxdb:latest-ci .
