#!/bin/bash

echo "=== Initializing Docker Swarm ==="
docker swarm init

echo "=== Creating overlay network ==="
docker network create --driver overlay --attachable microservices-net

echo "=== Deploying stack ==="
docker stack deploy -c docker-compose.yml microservices

echo "=== Checking services ==="
docker service ls

echo "=== Stack deployed successfully! ==="
echo "NGINX is available at: http://localhost:8080"
echo "Services:"
echo "  Service1: http://localhost:3001"
echo "  Service2: http://localhost:3002"
echo "  Service3: http://localhost:3003"
