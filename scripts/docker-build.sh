#!/usr/bin/env bash

set -eo pipefail

ROOT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && dirname `pwd` )"

DOCKER_MACHINE_NAME="cloumunda"
eval "$(docker-machine env $DOCKER_MACHINE_NAME)"

#Build cloudera process
docker run -it --rm --name my-maven-project -v "$ROOT_DIR/camunda/processes/remote-work-request:/app" -v "$HOME/.m2:/home/root/.m2" -w /app maven mvn clean install

docker-compose -f "$ROOT_DIR/docker-compose.yml" build camunda