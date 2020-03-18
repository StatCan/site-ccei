FROM alpine:3.8

RUN apk --update --no-cache add squid
COPY config/squid.conf /etc/squid/squid.conf
EXPOSE 80
COPY scripts/entrypoint.sh /entrypoint.sh
ENTRYPOINT ["./entrypoint.sh"]
