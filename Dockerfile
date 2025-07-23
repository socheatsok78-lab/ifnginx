ARG NGINX_VERSION=stable-alpine

FROM chocolatefrappe/nginx-modules:${NGINX_VERSION}-geoip2  AS mod-geoip2


FROM ghcr.io/socheatsok78/maxminddb:geolite2-asn AS geolite2-asn
FROM ghcr.io/socheatsok78/maxminddb:geolite2-city AS geolite2-city
FROM ghcr.io/socheatsok78/maxminddb:geolite2-country AS geolite2-country

FROM nginx:stable-alpine
COPY --from=geolite2-asn --link /GeoLite2-ASN.mmdb /etc/nginx/GeoIP2/GeoLite2-ASN.mmdb
COPY --from=geolite2-city --link /GeoLite2-City.mmdb /etc/nginx/GeoIP2/GeoLite2-City.mmdb
COPY --from=geolite2-country --link /GeoLite2-Country.mmdb /etc/nginx/GeoIP2/GeoLite2-Country.mmdb

COPY --from=mod-geoip2  / /tmp/nginx-modules
RUN set -ex \
    && cd /tmp/nginx-modules \
    && for mod in module-available.d/*; do \
            module=$(basename $mod); \
            apk add --no-cache --allow-untrusted packages/nginx-module-${module}-${NGINX_VERSION}*.apk; \
        done \
    && rm -rf /tmp/nginx-modules

ADD rootfs /
