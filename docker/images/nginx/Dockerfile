ARG BASE_IMAGE=wcms/stc-default
FROM $BASE_IMAGE as src

FROM nginx:alpine
COPY --from=src /var/www/html /var/www/html
