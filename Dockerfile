FROM redis:3.2.4-alpine

COPY docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]
