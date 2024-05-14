export COMPOSE_FILE=docker-compose.yml

docker --context=production compose stop
docker --context=production compose pull
docker --context=production compose up -d --build
