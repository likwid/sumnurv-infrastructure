FROM alpine:3.2
RUN apk --update add bash haproxy ca-certificates && rm -rf /var/cache/apk/*
CMD "haproxy -f /haproxy/haproxy.cfg"
