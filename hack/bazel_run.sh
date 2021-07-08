#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail

LANG=${LANG:-"base"}
TOPICS=${TOPICS:-"base debug"}
USERS=${TARGETS:-"root nonroot"}
ARCHS=${ARCHS:-"amd64 arm64"}

for topic in ${TOPICS}; do
  for user in ${USERS}; do
    for arch in ${ARCHS}; do
      bazel run --jobs=1 --host_force_python=PY2 //${LANG}:${topic}_${user}_${arch}_debian10
    done
  done
done