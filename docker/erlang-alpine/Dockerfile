FROM alpine:3.2
RUN echo 'http://dl-4.alpinelinux.org/alpine/edge/main' >> /etc/apk/repositories
RUN apk --update add ncurses-libs erlang && rm -rf /var/cache/apk/*
CMD ["/bin/sh"]
