# docker-warp-proxy

Docker image to run Cloudflare Warp in proxy mode.

## Usage

```
docker run -d -p 40000:40000 --restart always yarmak/warp-proxy
```

SOCKS5 proxy server will be listening at port 40000.
