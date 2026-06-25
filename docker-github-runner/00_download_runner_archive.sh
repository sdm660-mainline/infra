#!/bin/sh

VER=2.335.1

for ARCH in x64 arm64; do
	curl -o actions-runner-linux-${ARCH}-${VER}.tar.gz -L https://github.com/actions/runner/releases/download/v${VER}/actions-runner-linux-${ARCH}-${VER}.tar.gz
	ln -sf actions-runner-linux-${ARCH}-${VER}.tar.gz actions-runner-linux-${ARCH}.tar.gz
done
