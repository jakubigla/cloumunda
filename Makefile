.DEFAULT_GOAL := setup

setup:
	@./scripts/docker-env.sh

run:
	@./scripts/docker-run.sh

build:
	@./scripts/docker-build.sh