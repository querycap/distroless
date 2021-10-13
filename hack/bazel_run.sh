#!/bin/bash

set -eux;

LANG=${LANG:-"base"}
TOPICS=${TOPICS:-"base debug"}
USERS=${TARGETS:-"root nonroot"}
ARCHS=${ARCHS:-"amd64 arm64"}
DISTROS=${DISTROS:-"debian10 debian11"}

for topic in ${TOPICS}; do
  for user in ${USERS}; do
    for arch in ${ARCHS}; do
      for distro in ${DISTROS}; do
            bazel run --jobs=1 --host_force_python=PY2 //${LANG}:${topic}_${user}_${arch}_${distro}
      done
    done
  done
done