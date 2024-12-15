FROM node:current-bookworm AS hugo

RUN mkdir /src
WORKDIR /src

COPY hugo_extended_0.135.0_linux-amd64.deb /src/

RUN apt-get -y update
RUN apt-get -y install /src/hugo_extended_0.135.0_linux-amd64.deb

COPY themes/ /src/themes/
COPY config.toml /src/
COPY content/ /src/content/
COPY data/ /src/data/
COPY assets /src/assets/

RUN npm install ./themes/sunflower

RUN hugo -d /target

FROM nginx:latest

COPY --from=hugo --chown=nginx /target /usr/share/nginx/html/
