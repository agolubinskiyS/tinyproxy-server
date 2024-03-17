FROM ubuntu:latest

RUN apt-get update && \
    apt-get install -y tinyproxy

WORKDIR /tinyproxy
COPY docker/tinyproxy.conf /etc/tinyproxy/tinyproxy.conf
COPY docker/entrypoint.sh /entrypoint.sh

RUN mkdir -p /var/log/tinyproxy  \
    && chown -R tinyproxy:tinyproxy /var/log/tinyproxy \
    && chown -R tinyproxy:tinyproxy /etc/tinyproxy/tinyproxy.conf

USER tinyproxy:tinyproxy

EXPOSE 8888

CMD ["/entrypoint.sh"]