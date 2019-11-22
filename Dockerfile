FROM grafana/grafana:6.3.7
MAINTAINER doingbylearning

ENV DUMB_INIT_VERSION 1.2.2
ENV GRAFANA_VERSION=6.4.4

RUN apk add --update --no-cache ca-certificates openssl bash coreutils curl 

RUN curl -L -o /usr/local/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v${DUMB_INIT_VERSION}/dumb-init_$(${DUMB_INIT_VERSION}_amd64 \
    && chmod +x /usr/local/bin/dumb-init

ENTRYPOINT [ "/usr/local/bin/dumb-init", "--" ]
CMD [ "/bin/bash" ]