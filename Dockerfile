FROM debian:jessie

ENTRYPOINT ["/entrypoint"]

VOLUME /etc/ca
RUN apt-get update -yq && \
    DEBIAN_FRONTEND=noninteractive apt-get install openvpn openssl -yq && \
    apt-get autoremove -y && \
    apt-get clean

RUN groupadd -r nobody

COPY server.conf.template /etc/openvpn/server.conf.template
COPY easyrsa-vars /etc/easyrsa-vars
COPY entrypoint /entrypoint

