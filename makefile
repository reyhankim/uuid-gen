REGISTRY = hikarukei
NAME = uuid-gen
IMAGE_NAME = uuid-gen
VERSION = latest

build:
	docker build -t $(REGISTRY)/$(IMAGE_NAME):$(VERSION) .
run:
	docker run -d --rm --name $(IMAGE_NAME) -p 8080:8080 $(REGISTRY)/$(IMAGE_NAME):$(VERSION)
clean:
	docker stop $(IMAGE_NAME) || true
	docker rm $(IMAGE_NAME) || true
	docker rmi $(REGISTRY)/$(IMAGE_NAME):$(VERSION)