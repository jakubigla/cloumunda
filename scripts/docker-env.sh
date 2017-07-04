#!/usr/bin/env bash

set -eo pipefail

DOCKER_MACHINE_NAME="cloumunda"
DOCKER_CPU_COUNT=2
DOCKER_MEMORY=8192

HOSTNAMES=("quickstart.cloudera" "camunda.ons")

#Create a docker machine
if docker-machine ls | grep "$DOCKER_MACHINE_NAME"; then
    echo "Starting docker machine..."
    if [ `docker-machine status $DOCKER_MACHINE_NAME` != "Running" ]; then
        docker-machine start "$DOCKER_MACHINE_NAME" > /dev/null
    fi
else
    echo "Creating docker machine..."
    docker-machine create "$DOCKER_MACHINE_NAME" -d virtualbox \
        --virtualbox-cpu-count "$DOCKER_CPU_COUNT" --virtualbox-memory "$DOCKER_MEMORY" > /dev/null
fi

#Update hosts for better experience
DOCKER_IP=$(docker-machine ip "$DOCKER_MACHINE_NAME")

for LOCAL_HOSTNAME in "${HOSTNAMES[@]}"; do
    echo "Adding $DOCKER_IP $LOCAL_HOSTNAME to the hosts file..."
    sudo bash -c "sed -i '' '/${LOCAL_HOSTNAME}/d' /etc/hosts"
    sudo bash -c "echo '$DOCKER_IP  $LOCAL_HOSTNAME' >> /etc/hosts"
done