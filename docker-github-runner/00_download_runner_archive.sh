#!/bin/sh
VER=2.325.0
curl -O -L https://github.com/actions/runner/releases/download/v${VER}/actions-runner-linux-arm64-${VER}.tar.gz
ln -sf actions-runner-linux-arm64-${VER}.tar.gz actions-runner-linux-arm64.tar.gz
