#!/usr/bin/env bash

set -eo pipefail

DOCKER_MACHINE_NAME="cloumunda"

eval "$(docker-machine env $DOCKER_MACHINE_NAME)"

docker-compose up -d