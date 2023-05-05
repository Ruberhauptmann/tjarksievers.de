FROM klakegg/hugo:0.101.0-ubuntu-onbuild AS hugo

COPY themes/ /src/
COPY config.toml /src/
COPY content/ /src/

FROM nginx:latest

COPY nginx-config/default.conf /etc/nginx/conf.d/
COPY nginx-config/lecture-notes.htpasswd /etc/nginx/conf.d/
COPY --from=hugo --chown=nginx /target /usr/share/nginx/html/

