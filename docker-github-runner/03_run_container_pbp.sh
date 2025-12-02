#!/bin/sh
docker container run \
    --detach \
    --restart unless-stopped \
    --tty \
    --privileged \
    --name="actions-runner" \
    --cpuset-cpus="2,3,4,5" \
    --device-cgroup-rule="b 7:* rmw" \
    --device-cgroup-rule="b 259:* rmw" \
    --volume /home/runner:/home/runner \
    --volume /dev:/dev \
    "actions-runner"
