FROM tutum/curl:trusty
MAINTAINER François-Guillaume Ribreau <docker@fgribreau.com>

# Install InfluxDB
ENV INFLUXDB_VERSION 0.13.0
RUN curl -s -o /tmp/influxdb_latest_amd64.deb https://dl.influxdata.com/influxdb/releases/influxdb_${INFLUXDB_VERSION}_amd64.deb && \
  dpkg -i /tmp/influxdb_latest_amd64.deb && \
  rm /tmp/influxdb_latest_amd64.deb && \
  rm -rf /var/lib/apt/lists/*

ADD types.db /usr/share/collectd/types.db
ADD config.http.toml /config/config.http.toml
ADD config.https.toml /config/config.https.toml
ADD config.https.httpauth.toml /config/config.https.httpauth.toml
ADD run.sh /run.sh
ADD run.common.sh /run.common.sh
ADD run.http.sh /run.http.sh
ADD run.https.sh /run.https.sh
ADD run.https.httpauth.sh /run.https.httpauth.sh
RUN chmod +x /*.sh

ENV PRE_CREATE_DB **None**

# HTTP Admin server WebUI
EXPOSE 8083

# HTTP API
EXPOSE 8086

# HTTPS Admin server WebUI
EXPOSE 8085

# HTTPS API
EXPOSE 8084

# HTTPS+HTTP Auth Admin server WebUI
EXPOSE 9085

# HTTPS+HTTP Auth API
EXPOSE 9084

# Raft port (for clustering, don't expose publicly!)
#EXPOSE 8090

# Protobuf port (for clustering, don't expose publicly!)
#EXPOSE 8099

VOLUME ["/data"]

CMD ["/run.sh"]
