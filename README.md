# Deployment for my webpages

This repository controls the deployment for all the websites I host.

![Workflow](https://github.com/Ruberhauptmann/tjarksievers.de/actions/workflows/publish.yml/badge.svg)

## Overview

Deployment is done via Gitlab CI, using Docker containers to separate the different services running on the server.
All the pages can be found under `pages` in respective directories.
Each page has its own `docker-compose.yml` file, these are added in the `.gitlab-ci.yml` to be deployed.
All pages get deployed on every commit to main.

Current pages under the domain:
- Landing page with my CV, project showcases and a blog at [tjarksievers.de](https://tjarksievers.de)
- A Grafana installation at [grafana.tjarksievers.de](https://grafana.tjarksievers.de)
- An InfluxDB installation at [influx.tjarksievers.de](https://influx.tjarksievers.de)

## Setup server for deployment

* Add 2 users: `tjark`, `deploy`
* Add public key from this repo (`deploy_key.pub`) as authorised key for the `deploy` user
* Get host key from the server and save it in this repo as `host_key.txt`
* Disable root ssh login (and lock down further as much as wanted)

## How to add new subpages

Create a new directory under `pages`, named like the subdomain it should run under.

All that is needed is a `docker-compose.yml` file, this needs to include at least the following to be reachable from outside:
```
services:
  <service_name>:
    container_name: <container_name>
    networks:
      - nginx-proxy
    environment:
      - VIRTUAL_HOST=tjarksievers.de
      - LETSENCRYPT_HOST=tjarksievers.de
      - LETSENCRYPT_EMAIL=tjark.sievers@outlook.de
    depends_on:
      - nginx-proxy
```

In the `.gitlab-ci.yml` file, under `deploy` add the file under all the under `docker-compose.yml` file (in all the locations!).

## Database for saboga

Authentication is enable via the docker-compose environment file

This user can authenticate to mongo:
```shell
docker exec -it saboga-database mongosh --authenticationDatabase admin -u "siteUserAdmin" -p
```
Then add the user ``api-user``, give role ``dbAdmin`` on database ``boardgames``

Add user ``backup``, give role ``backup``on database ``admin``
