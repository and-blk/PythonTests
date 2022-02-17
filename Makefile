SHELL := /bin/bash
FLASK_SRV ?= flaskapp
.PHONY: env
env:
	@echo "check required apps..."
	@which docker || echo "no docker"
	@which docker-compose || echo "no docker-compose"
	@which virtualenv || echo "no virtualenv"
	@echo "create and activate venv..."
	virtualenv venv --always-copy
	source venv/bin/activate

build-main-image: Dockerfile
	@echo "build image for backend tests..."
	docker build -t backend-tests-image:latest .

build-app-image: Dockerfile-app
	@echo "build application tests image..."
	docker build -t backend-test-application:latest -f Dockerfile-app --build-arg FLASK_SRV=$(FLASK_SRV) .

build: env build-main-image build-app-image

run-test-%: venv build
	docker run --network apm-integration-testing --rm --name backend-tests-container backend-test-application tests/agents/test_$*.py
