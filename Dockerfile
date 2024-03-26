# syntax=docker/dockerfile:1
FROM alpine:latest as builder
RUN apk --no-cache add ca-certificates curl
WORKDIR /root/
RUN	curl -L -o /cloudflared https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64
RUN chmod +x /cloudflared

FROM alpine:latest
RUN apk --no-cache add ca-certificates
WORKDIR /root/
COPY --from=builder /cloudflared /bin/cloudflared
CMD ["/bin/cloudflared", "--logfile", "/var/log/cloudflared", "--pidfile", "/var/run/cloudflared.pid", "--no-autoupdate", "proxy-dns", "--address", "0.0.0.0", "--port", "53"]
