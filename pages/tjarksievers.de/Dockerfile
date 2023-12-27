FROM node:current-bookworm AS hugo


RUN apt-get -y update
RUN apt-get -y install hugo

RUN mkdir /src
WORKDIR /src

COPY themes/ /src/themes/
COPY config.toml /src/
COPY content/ /src/content/
COPY data/ /src/data/
COPY static/ /src/static/

RUN npm install ./themes/sunflower

RUN hugo -d /target

FROM nginx:latest

COPY nginx-config/default.conf /etc/nginx/conf.d/
COPY nginx-config/lecture-notes.htpasswd /etc/nginx/conf.d/
COPY --from=hugo --chown=nginx /target /usr/share/nginx/html/
