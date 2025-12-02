#!/bin/sh
docker container run \
    --detach \
    --restart unless-stopped \
    --tty \
    --name="actions-runner" \
    --privileged \
    --volume /home/runner:/home/runner \
    --volume /dev:/dev \
    "actions-runner"
