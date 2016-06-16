FROM alpine:latest

RUN apk add --update curl python && \
    rm -rf /var/cache/apk/*

COPY ./large_ram_sku.json /large_ram_sku.json
COPY ./small_ram_sku.json /small_ram_sku.json
COPY ./memory_catalog.json /memory_catalog.json
COPY ./rancher_standby.json /rancher_standby.json
COPY ./docker-entrypoint.sh /docker-entrypoint.sh

CMD [ "/docker-entrypoint.sh" ]
