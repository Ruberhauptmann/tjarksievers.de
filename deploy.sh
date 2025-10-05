files=(
  docker-compose.yml
  pages/tjarksievers.de/docker-compose.yml
  pages/sunflower.tjarksievers.de/docker-compose.yml
  pages/saboga.tjarksievers.de/docker-compose.yml
  pages/monitoring.tjarksievers.de/docker-compose.yml
  pages/nc.tjarksievers.de/docker-compose.yml
)

COMPOSE_FILE=$( IFS=:; printf '%s' "${files[*]}" )
export COMPOSE_FILE

REMOTE_USER="deploy"
REMOTE_HOST="tjarksievers.de"

echo "Copying Traefik config files to remote..."
scp traefik.yml dynamic.yml "$REMOTE_USER@$REMOTE_HOST:/tmp/"

echo "Stopping old containers..."
docker --context=production compose stop

echo "Deploying..."
docker --context=production compose up -d --build

