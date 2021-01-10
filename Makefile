SHELL := /bin/bash

CLUSTER_NAME := minikube
CLUSTER_REGISTRY := ctlptl-registry
CLUSTER_VERSION := 1.20.0

.PHONY: up
up: cluster-up

.PHONY: down
down: cluster-down

.PHONY: cluster-up
cluster-up: registry-up
	ctlptl create cluster ${CLUSTER_NAME} \
		--min-cpus=4 \
		--registry=${CLUSTER_REGISTRY} \
		--kubernetes-version=${CLUSTER_VERSION}

.PHONY: registry-up
registry-up:
	ctlptl create registry ${CLUSTER_REGISTRY} --port=5000

.PHONY: cluster-down
cluster-down: registry-down
	ctlptl delete cluster ${CLUSTER_NAME} \
		--ignore-not-found

.PHONY: registry-down
registry-down:
	ctlptl delete registry ${CLUSTER_REGISTRY} \
		--ignore-not-found
