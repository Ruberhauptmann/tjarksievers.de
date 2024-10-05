+++
title = "tjarksievers.de"
date = 2024-07-17
link = "https://github.com/Ruberhauptmann/tjarksievers.de"
author = "Tjark Sievers"
categories = ["Project Showcases"]
tags = ["Docker"]
+++

This website and its deployment process are available publicly on Gitlab.

<!--more-->

Deployment is done via Gitlab CI, using Docker containers to separate the different services running on the server.
All the pages can be found under `pages` in respective directories.
Each page has its own `docker-compose.yml` file, these are added in the `.gitlab-ci.yml` to be deployed.
All pages get deployed on every commit to main.

Current pages under the domain:
- Landing page with my CV, project showcases and a blog at [tjarksievers.de](https://tjarksievers.de)
- Backend for saboga at [saboga.tjarksievers.de/api](https://saboga.tjarksievers.de/api)
- Frontend for saboga at [saboga.tjarksievers.de](https://saboga.tjarksievers.de)
- Example site for the sunflower theme at [sunflower.tjarksievers.de](https://sunflower.tjarksievers.de)
