#!/bin/bash
set -euxo pipefail

cd /tmp/src

yum -y install docker
service docker start

TAG="0.1"

docker build -t awswift/swift-deps:$TAG base

# docker build -t awswift/swift-compiler:$TAG compiler
# docker run --cidfile=cid awswift/swift-compiler:$TAG true
# CID=$(cat cid)
# docker cp $CID:/swiftbuild/package/swift-linux-x86_64-amzn.tgz .
# docker rm $CID

# docker build -t awswift/swiftda:$TAG swiftda
# docker tag awswift/swiftda:$TAG awswift/swiftda:latest

# docker push awswift/swiftda:$TAG
# docker push awswift/swiftda:latest
