FROM ghcr.io/socheatsok78/maxminddb:geolite2-asn AS geolite2-asn
FROM ghcr.io/socheatsok78/maxminddb:geolite2-city AS geolite2-city
FROM ghcr.io/socheatsok78/maxminddb:geolite2-country AS geolite2-country

FROM nginx
COPY --from=geolite2-asn --link /GeoLite2-ASN.mmdb /etc/nginx/GeoIP2/GeoLite2-ASN.mmdb
COPY --from=geolite2-city --link /GeoLite2-City.mmdb /etc/nginx/GeoIP2/GeoLite2-City.mmdb
COPY --from=geolite2-country --link /GeoLite2-Country.mmdb /etc/nginx/GeoIP2/GeoLite2-Country.mmdb
RUN apk add --no-cache libmaxminddb
ADD rootfs /

ENV NGINX_ENTRYPOINT_WORKER_PROCESSES_AUTOTUNE=1
