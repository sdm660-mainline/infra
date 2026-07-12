#!/bin/sh
docker container run \
    --detach \
    --restart unless-stopped \
    --tty \
    --privileged \
    --name="actions-runner" \
    --cpuset-cpus="0,1,2,3,4" \
    --device-cgroup-rule="b 7:* rmw" \
    --device-cgroup-rule="b 259:* rmw" \
    --volume /home/runner:/home/runner \
    --volume /dev:/dev \
    --volume /run/docker.sock:/run/docker.sock \
    "actions-runner"
