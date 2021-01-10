SHELL := /bin/bash

CLUSTER_NAME := minikube
CLUSTER_REGISTRY := ctlptl-registry
CLUSTER_VERSION := 1.20.0

.PHONY: cluster-up
cluster-up:
	ctlptl create cluster ${CLUSTER_NAME} \
		--min-cpus=4 \
		--registry=${CLUSTER_REGISTRY} \
		--kubernetes-version=${CLUSTER_VERSION}

.PHONY: cluster-down
cluster-down:
	ctlptl delete cluster ${CLUSTER_NAME} \
		--ignore-not-found