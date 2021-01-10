#!/bin/bash

APP=demoapp
REPO="localhost:5000"

docker build -t ${APP} -f deploy/Dockerfile src/
TAG=$(docker images demoapp -q | head -n 1)
NAME="${REPO}/${APP}:${TAG}"
docker tag ${APP} ${NAME}
docker push ${NAME}

cat deploy/k8s.yaml | sed -e "s!image: ${APP}!image: ${NAME}!g" | kubectl apply -f -
