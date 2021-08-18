#! /bin/bash
version=v$(date "+%Y%m%d")

set -ex
#echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin

docker build -f Dockerfile --build-arg QL_VERSION="$QL_VERSION" -t gcdd1993/qinglong-xdd:latest -t gcdd1993/qinglong-xdd:"$version" .
#docker push gcdd1993/qinglong-xdd:latest
#docker push gcdd1993/qinglong-xdd:"$version"
