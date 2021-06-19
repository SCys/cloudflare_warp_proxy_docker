#!/bin/bash

yes | warp-cli status

(
while ! warp-cli register; do
	sleep 1
	>&2 echo "Awaiting warp-svc become online..."
done
warp-cli set-mode proxy
warp-cli set-proxy-port 40001
warp-cli connect
haproxy -f /etc/haproxy/haproxy.cfg
) &

exec warp-svc
