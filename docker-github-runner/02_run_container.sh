#!/bin/sh
docker run \
    -d \
    --rm \
    --tty \
    --cpuset-cpus="2,3,4,5" \
    --name="actions-runner" \
    --privileged \
    --device-cgroup-rule="b 7:* rmw" \
    --device-cgroup-rule="b 259:* rmw" \
    -v /home/runner:/home/runner \
    -v /dev:/dev \
    "actions-runner"
