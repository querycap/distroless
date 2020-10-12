#!/bin/bash

set -eu;

DRY_RUN=${DRY_RUN:-}
HUB=${HUB:-localhost:5000/distroless}

build() {
  TARGET=${TARGET}
  NAME=${NAME}
  TAG=${TAG:-latest}

  echo "//${TARGET} => ${HUB}/${NAME}:${TAG}"

  if [[ -z ${DRY_RUN} ]]; then
    bazel run --host_force_python=PY2 //${TARGET}
    docker tag bazel/${TARGET} ${HUB}/${NAME}:${TAG}
    docker push ${HUB}/${NAME}:${TAG}
  fi
}


echo "================================"
echo "cooking $1..."
echo "================================"

if [[ -n $1 ]]; then
  VARS=$(echo $1 | tr "/:" "\t")

  GROUP=$(echo ${VARS} | awk '{ print $1 }')
  TOPIC=$(echo ${VARS} | awk '{ print $2 }')
  USER=$(echo ${VARS} | awk '{ print $3 }')
fi

GROUP=${GROUP:-base}
TOPIC=${TOPIC:-static}
USER=${USER:-root}
DISTRO=${DISTRO:-debian10}

NAME=${TOPIC}-${DISTRO}

if [[ ${GROUP} == "nodejs" ]]; then 
  USER=""
fi


case ${TOPIC} in
debug)
  NAME=${GROUP}-${DISTRO}
  VERSION=debug
  ;;
${GROUP}*)
  NAME=${GROUP}-${DISTRO}
  VERSION=$(echo "${TOPIC//${GROUP}/}" | sed 's/_/-/g')
  ;;
*)
  NAME=${TOPIC}-${DISTRO}
  ;;
esac

VERSION=${VERSION:-latest}

if [[ ${USER} == "nonroot" ]]; then
  if [[ ${VERSION} == "latest" ]]; then
    VERSION=${USER};
  else
    VERSION=${VERSION}-${USER};
  fi
fi

TARGET_BASE=${GROUP}:${TOPIC}

if [[ -n ${USER} ]]; then
  TARGET_BASE=${TARGET_BASE}_${USER}
fi


if [[ -z ${DRY_RUN} ]]; then
  bazel build --host_force_python=PY2 //package_manager:dpkg_parser.par
fi

TARGET=${TARGET_BASE}_amd64_${DISTRO} NAME=${NAME} TAG=${VERSION}-amd64 build
TARGET=${TARGET_BASE}_arm64_${DISTRO} NAME=${NAME} TAG=${VERSION}-arm64 build

echo "::set-output name=image::${HUB}/${NAME}:${VERSION}"
echo "::set-output name=mirror_docker::docker.io/querycapdistroless/${NAME}:${VERSION}"
echo "::set-output name=mirror_ghcr::ghcr.io/querycap/distroless/${NAME}:${VERSION}"

echo "================================"
