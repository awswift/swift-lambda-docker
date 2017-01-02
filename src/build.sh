#!/bin/bash
set -euxo pipefail

TAG="0.1"

docker build -t awswift/swift-deps:$TAG base

docker build -t awswift/swift-compiler:$TAG compiler
docker run --cidfile=cid awswift/swift-compiler:$TAG true
CID=$(cat cid)
docker cp $CID:/swiftbuild/package/swift-linux-x86_64-amzn.tgz swiftda/swift-linux-x86_64-amzn.tgz
docker rm $CID

docker build -t awswift/swiftda:$TAG swiftda
