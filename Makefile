CANTRIP_DOCKER_IMAGE ?= cantrip
CANTRIP_CONTAINER ?= cantrip
USER ?= $(shell id -un)
UID ?= $(shell id -u)

.PHONY: build default

default:

build: Dockerfile
	DOCKER_BUILDKIT=1 docker build \
		--build-arg USER=$(USER) --build-arg UID=$(UID) \
		-t $(CANTRIP_DOCKER_IMAGE):$(USER) -f $< .


run: build
	docker run --init --privileged --rm \
                --name $(CANTRIP_CONTAINER)_$(USER) \
                $(CANTRIP_DOCKER_IMAGE):$(USER) sleep inf

exec:
	docker exec -i -t $(CANTRIP_CONTAINER)_$(USER) /bin/bash || true

kill:
	docker kill $(CANTRIP_CONTAINER)_$(USER)