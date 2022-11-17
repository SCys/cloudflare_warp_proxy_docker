[![docker-ci](https://github.com/SCys/cloudflare_warp_proxy_docker/actions/workflows/docker-ci.yml/badge.svg)](https://github.com/SCys/cloudflare_warp_proxy_docker/actions/workflows/docker-ci.yml)
![Docker Pulls](https://img.shields.io/docker/pulls/scys/warp-proxy)

Docker image to run Cloudflare Warp in proxy mode. Image is rebuilt and updated every day.

## Usage

```
docker run -d -p 40000:40000 --restart unless-stopped scys/warp-proxy
```

SOCKS5 proxy server will be listening at port 40000.
