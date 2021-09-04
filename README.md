# docker-cloudflared

Dockerized `cloudflared` binary for various environments.

## AMD64

```
docker run --restart always -d -p 192.168.129.105:53:53/udp ghcr.io/blackstar257/docker-cloudflared/image:latest
```

## ARM32

Uses Alpine v3.12 due to changes in 3.13. https://wiki.alpinelinux.org/wiki/Release_Notes_for_Alpine_3.13.0#time64_requirements

```
docker run --restart always -d -p 192.168.129.105:53:53/udp ghcr.io/blackstar257/docker-cloudflared/image:arm32
```