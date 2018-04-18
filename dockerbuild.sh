#!/bin/bash -e

if [ "$1" == "" ]; then
  echo You should specify the perl version to build, i.e. dockerbuild.sh 5.26.0
  exit 1
fi

docker build --build-arg PERLVER="$1" -t andyg42/perl:${1} .
docker push andyg42/perl:${1}
