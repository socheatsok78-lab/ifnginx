FROM ghcr.io/socheatsok78-lab/maxminddb:geolite2-asn AS geolite2-asn
FROM ghcr.io/socheatsok78-lab/maxminddb:geolite2-city AS geolite2-city
FROM ghcr.io/socheatsok78-lab/maxminddb:geolite2-country AS geolite2-country

FROM xnginx
COPY --from=geolite2-asn --link / /etc/nginx/GeoIP2/
COPY --from=geolite2-city --link / /etc/nginx/GeoIP2/
COPY --from=geolite2-country --link / /etc/nginx/GeoIP2/
ADD rootfs /
ENV NGINX_ENTRYPOINT_WORKER_PROCESSES_AUTOTUNE=1
