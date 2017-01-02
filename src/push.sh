#!/bin/bash
set -euxo pipefail

docker login -u $DOCKERHUB_USER -p $DOCKERHUB_PASSWORD
docker push awswift/swiftda:$TAG
