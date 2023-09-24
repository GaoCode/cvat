# remove current mount
docker volume rm cvat_cvat_share

sudo chown -R $USER:users bushfire

# Run docker containers. It will take some time to download the latest CVAT release and other required images like postgres, redis, etc. from DockerHub and create containers.

docker compose up -d

# Stop all containers 
# The command below stops and removes containers and networks created by up.

docker compose down

# The following command allows testing the CVAT container to make sure it works.
docker exec -t cvat_server python manage.py health_check

# Then you can start the containers using
docker compose up --build

docker-compose up -d

docker exec -it cvat_server bash -ic 'python3 ~/manage.py createsuperuser'

docker run -p 8080:8080 --name some-cvat-server -e CVAT_POSTGRES_HOST=DB_HOST -e CVAT_REDIS_HOST=REDIS_HOST -d cvat/server

# If you did any changes to the Docker Compose files, make sure to add --build at the end.
docker compose -f docker-compose.yml -f components/serverless/docker-compose.serverless.yml up -d

docker-compose -f docker.yml up -d

# docker compose -f docker-compose.yml -f components/serverless/docker-compose.serverless.yml up -d

# To stop the containers, simply run:
docker compose -f docker-compose.yml -f components/serverless/docker-compose.serverless.yml down
