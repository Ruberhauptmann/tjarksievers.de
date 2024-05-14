files=(
  docker-compose.yml
  pages/tjarksievers.de/docker-compose.yml
  )

for i in "${files[@]}"
do
  export COMPOSE_FILE=$COMPOSE_FILE:$i
done

echo "${COMPOSE_FILE}"

docker --context=production compose stop
docker --context=production compose pull
docker --context=production compose up -d --build
