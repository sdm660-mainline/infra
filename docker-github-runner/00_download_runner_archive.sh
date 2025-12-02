#!/bin/sh
VER=2.330.0
ARCH=x64
curl -o actions-runner-linux-${ARCH}-${VER}.tar.gz -L https://github.com/actions/runner/releases/download/v${VER}/actions-runner-linux-${ARCH}-${VER}.tar.gz
ln -sf actions-runner-linux-${ARCH}-${VER}.tar.gz actions-runner-linux.tar.gz
