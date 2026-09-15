FROM alpine:latest

# Install ziproxy only - no Xray needed
RUN apk add --no-cache ziproxy bash

# Create config directory
RUN mkdir -p /etc/ziproxy

# Write ziproxy config
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
