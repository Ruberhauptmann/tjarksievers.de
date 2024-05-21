+++
title = "tjarksievers.de"
date = 2023-05-28
link = "https://github.com/Ruberhauptmann/tjarksievers.de"
author = "Tjark Sievers"
categories = ["Project Showcases"]
tags = ["Docker"]
+++

This website and its deployment process are available publicly on Gitlab.

Deployment is done via Gitlab CI, using Docker containers to separate the different services running on the server.
All the pages can be found under `pages` in respective directories.
Each page has its own `docker-compose.yml` file, these are added in the `.gitlab-ci.yml` to be deployed.
All pages get deployed on every commit to main.

Current pages under the domain:
- Landing page with my CV, project showcases and a blog at [tjarksievers.de](https://tjarksievers.de)
- [api.saboga.tjarksievers.de](https://api.saboga.tjarksievers.de)
- [saboga.tjarksievers.de](https://saboga.tjarksievers.de)
