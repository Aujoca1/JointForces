#!/bin/bash

echo "=== Removing stack ==="
docker stack rm microservices

echo "=== Leaving swarm (if manager) ==="
docker swarm leave --force

echo "=== Cleanup completed ==="
