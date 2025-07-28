FROM ghcr.io/socheatsok78/maxminddb:latest AS maxminddb

FROM xnginx
COPY --from=maxminddb --link /GeoLite2-ASN.mmdb /etc/nginx/GeoIP2/GeoLite2-ASN.mmdb
COPY --from=maxminddb --link /GeoLite2-City.mmdb /etc/nginx/GeoIP2/GeoLite2-City.mmdb
COPY --from=maxminddb --link /GeoLite2-Country.mmdb /etc/nginx/GeoIP2/GeoLite2-Country.mmdb
ADD rootfs /
ENV NGINX_ENTRYPOINT_WORKER_PROCESSES_AUTOTUNE=1
