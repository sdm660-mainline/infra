#!/bin/sh
docker build -t alpine-kbuilder:latest -f Dockerfile.alpine .

# copy tag as 3.24
docker image tag alpine-kbuilder:latest alpine-kbuilder:3.24
# for publishing
docker image tag alpine-kbuilder:latest minlexx/alpine-kbuilder:latest
docker image tag alpine-kbuilder:3.24   minlexx/alpine-kbuilder:3.24
