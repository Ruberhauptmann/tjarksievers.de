files=(
  docker-compose.yml
  pages/tjarksievers.de/docker-compose.yml
  pages/budget.tjarksievers.de/docker-compose.yml
  pages/api.saboga.tjarksievers.de/docker-compose.yml
  #pages/saboga.tjarksievers.de/docker-compose.yml
)

COMPOSE_FILE=$( IFS=:; printf '%s' "${files[*]}" )
export COMPOSE_FILE

mkdir /mgob
mkdir /mgob/config
mkdir /mgob/storage
mkdir /mgob/tmp
mkdir /mgob/data
cp pages/api.saboga.tjarksievers.de/backup.yaml /mgob/config/backup.yaml

docker --context=production compose stop
docker --context=production compose pull
docker --context=production compose up -d --build

