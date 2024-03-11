FRP_VERSION=0.54.0
ARCHITECTURE=amd64
TAG_WITH_VERSION=mingmxren/frp:$(FRP_VERSION)
TAG_LATEST=mingmxren/frp:latest

all: build tag_latest push

build:
	docker build --build-arg FRP_VERSION_ARG=$(FRP_VERSION) --build-arg ARCHITECTURE_ARG=$(ARCHITECTURE) -t $(TAG_WITH_VERSION) .

tag_latest:
	docker tag $(TAG_WITH_VERSION) $(TAG_LATEST)

push:
	docker push $(TAG_WITH_VERSION)
	docker push $(TAG_LATEST)