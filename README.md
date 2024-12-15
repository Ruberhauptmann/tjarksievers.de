# Deployment for my webpages

This repository controls the deployment for all the websites I host.

![Workflow](https://github.com/Ruberhauptmann/tjarksievers.de/actions/workflows/publish.yml/badge.svg)

## Overview

Deployment is done via Gitlab CI, using Docker containers to separate the different services running on the server.
All the pages can be found under `pages` in respective directories.
Each page has its own `docker-compose.yml` file, these are added in the `deploy.sh` file to be deployed in a Github action.
All pages get deployed on every commit to main.

Current pages under the domain:
- Landing page with my CV, project showcases and a blog at [tjarksievers.de](https://tjarksievers.de)
- Backend for saboga at [saboga.tjarksievers.de/api](https://saboga.tjarksievers.de/api)
- Frontend for saboga at [saboga.tjarksievers.de](https://saboga.tjarksievers.de)
- Example site for the sunflower theme at [sunflower.tjarksievers.de](https://sunflower.tjarksievers.de)

## Setup server for deployment

* Add 2 users: `tjark`, `deploy`
* Add public key from this repo (`deploy_key.pub`) as authorised key for the `deploy` user
* Get host key from the server and save it in this repo as `host_key.txt`
* Disable root ssh login (and lock down further as much as wanted)

## How to add new subpages

Create a new directory under `pages`, named like the subdomain it should run under.

All that is needed is a `docker-compose.yml` file, for example for the main page:
```yaml
services:
  tjarksievers-de:
    build: pages/tjarksievers.de
    container_name: tjarksievers-de
    labels:
      - "traefik.http.routers.tjarksievers-de.rule=Host(`tjarksievers.de`)"
      - "traefik.http.routers.tjarksievers-de.tls=true"
      - "traefik.http.routers.tjarksievers-de.tls.certresolver=certresolver"
    restart: always
    networks:
      - reverse-proxy
    depends_on:
      - reverse-proxy
```
The labels determine the domain under which the container is hosted, the network ensures that the reverse-proxy container can see and serve the container.
For deployment, add the path to the `docker-compose.yml` file under files in the `deploy.sh` file.

## Database for saboga

Authentication is enabled via the docker-compose environment file

This user can authenticate to mongo:
```shell
docker exec -it saboga-database mongosh --authenticationDatabase admin -u "siteUserAdmin" -p
```
Then add the user ``api-user``, give role ``readWrite`` on database ``boardgames``

Add user ``backup``, give role ``backup``on database ``admin``
