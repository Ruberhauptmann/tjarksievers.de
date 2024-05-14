export COMPOSE_FILE='
  docker-compose.yml:
  pages/tjarksievers.de/docker-compose.yml
'

echo "${COMPOSE_FILE}"

docker --context=production compose stop
docker --context=production compose pull
docker --context=production compose up -d --build
