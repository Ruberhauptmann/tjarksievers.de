files=(
  docker-compose.yml
  pages/tjarksievers.de/docker-compose.yml
  pages/sunflower.tjarksievers.de/docker-compose.yml
  pages/saboga.tjarksievers.de/docker-compose.yml
  pages/monitoring.tjarksievers.de/docker-compose.yml
  pages/nc.tjarksievers.de/docker-compose.yml
  pages/mtg.tjarksievers.de/docker-compose.yml
)

COMPOSE_FILE=$( IFS=:; printf '%s' "${files[*]}" )
export COMPOSE_FILE

echo "Stopping old containers..."
docker --context=production compose stop

echo "Deploying..."
docker --context=production compose up -d --build

ssh deploy@tjarksievers.de "docker cp /srv/mtg-timeline-game/src/ mtg-tjarksievers-de:/usr/share/nginx/html/"

