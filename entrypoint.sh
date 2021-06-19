#!/bin/bash

yes | warp-cli status

(
while ! warp-cli register; do
	sleep 1
	>&2 echo "Awaiting warp-svc become online..."
done
warp-cli set-mode proxy
warp-cli set-proxyport 40001
warp-cli connect
) &

exec warp-svc
