ARG DEBIAN_RELEASE=buster
FROM docker.io/debian:$DEBIAN_RELEASE-slim
ARG DEBIAN_RELEASE
COPY pubkey.gpg entrypoint.sh /
ENV DEBIAN_FRONTEND noninteractive
RUN true && \
	apt update && \
	apt install -y gnupg ca-certificates libcap2-bin haproxy && \
	apt-key add /pubkey.gpg && \
	echo "deb http://pkg.cloudflareclient.com/ $DEBIAN_RELEASE main" > /etc/apt/sources.list.d/cloudflare-client.list && \
	apt update && \
	apt install cloudflare-warp -y && \
	apt clean -y && \
	chmod +x /entrypoint.sh

EXPOSE 40000/tcp
ENTRYPOINT [ "/entrypoint.sh" ]
