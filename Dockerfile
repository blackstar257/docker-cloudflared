FROM debian:latest

RUN	apt-get update \
  && apt-get install -y \
	ca-certificates \
	curl \
	&& rm -rf /var/lib/apt/lists/*
  
RUN	curl https://bin.equinox.io/c/VdrWdbjqyF/cloudflared-stable-linux-386.tgz | tar xzC /bin

EXPOSE 53

CMD ["/bin/cloudflared", "--logfile", "/var/log/cloudflared", "--pidfile", "/var/run/cloudflared.pid", "--no-autoupdate", "--proxy-dns", "--proxy-dns-address", "0.0.0.0", "--proxy-dns-port", "53", "--proxy-dns-upstream", "https://1.1.1.1/dns-query", "--proxy-dns-upstream", "https://1.0.0.1/dns-query"]
