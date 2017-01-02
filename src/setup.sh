#!/bin/bash
set -euxo pipefail

yum -y install docker
service docker start
