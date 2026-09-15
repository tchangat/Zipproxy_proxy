FROM debian:slim

RUN apt-get update && apt-get install -y ziproxy && rm -rf /var/lib/apt/lists/*

RUN cat > /etc/ziproxy/ziproxy.conf <<EOF
Port = 8080
Address = "0.0.0.0"
ImageQuality = 20
ImageWidth = 800
ProcessHTML = true
ProcessCSS = true
ProcessJS = false
Gzip = true
UseContentEncoding = true
EOF

EXPOSE 8080
CMD ["ziproxy", "-d", "-c", "/etc/ziproxy/ziproxy.conf"]
