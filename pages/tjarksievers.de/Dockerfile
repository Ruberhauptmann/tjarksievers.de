FROM node:current-bookworm AS hugo

RUN mkdir /src
WORKDIR /src

COPY hugo_extended_0.135.0_linux-amd64.deb /src/

RUN apt-get -y update
RUN apt-get -y install /src/hugo_extended_0.135.0_linux-amd64.deb

COPY assets /src/assets/
COPY content/ /src/content/
COPY data/ /src/data/
COPY layouts/ /src/layouts/
COPY themes/ /src/themes/
COPY config.toml /src/

RUN npm install ./themes/sunflower

RUN hugo -d /target

FROM nginx:latest

COPY nginx-config/default.conf /etc/nginx/conf.d/
COPY nginx-config/lecture-notes.htpasswd /etc/nginx/conf.d/
COPY --from=hugo --chown=nginx /target /usr/share/nginx/html/
