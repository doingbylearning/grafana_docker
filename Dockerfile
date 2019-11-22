FROM ubuntu:20.04
MAINTAINER doingbylearning

ENV DUMB_INIT_VERSION 1.2.2
ENV GRAFANA_VERSION=6.4.4

RUN apt-get update && apt-get install openssl bash coreutils curl && apt-get clean

RUN curl -L -o /usr/local/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v${DUMB_INIT_VERSION}/dumb-init_${DUMB_INIT_VERSION}_amd64 \
    && chmod +x /usr/local/bin/dumb-init

RUN mkdir /opt/grafana/ \
    && curl -L -o /opt/grafana/grafana-6.4.4.linux-amd64.tar.gz https://dl.grafana.com/oss/release/grafana-6.4.4.linux-amd64.tar.gz

RUN tar xvfz /opt/grafana/grafana-6.4.4.linux-amd64.tar.gz -C /opt/grafana \ 
    && rm /opt/grafana/grafana-6.4.4.linux-amd64.tar.gz

ENTRYPOINT [ "/usr/local/bin/dumb-init", "--" ]
CMD [ "/bin/bash" ]