debug:
	cd ./distroless && DRY_RUN=1 ../hack/build.sh base/base
	cd ./distroless && DRY_RUN=1 ../hack/build.sh base/base:nonroot
	cd ./distroless && DRY_RUN=1 ../hack/build.sh base/debug
	cd ./distroless && DRY_RUN=1 ../hack/build.sh base/debug:nonroot
	cd ./distroless && DRY_RUN=1 ../hack/build.sh cc/cc
	cd ./distroless && DRY_RUN=1 ../hack/build.sh cc/cc:nonroot
	cd ./distroless && DRY_RUN=1 ../hack/build.sh cc/debug
	cd ./distroless && DRY_RUN=1 ../hack/build.sh cc/debug:nonroot
	cd ./distroless && DRY_RUN=1 ../hack/build.sh base/static
	cd ./distroless && DRY_RUN=1 ../hack/build.sh base/static:nonroot
	cd ./distroless && DRY_RUN=1 ../hack/build.sh nodejs/nodejs10
	cd ./distroless && DRY_RUN=1 ../hack/build.sh nodejs/nodejs10_debug

run:
	cd ./distroless && ../hack/build.sh base/static:nonroot

update:
	 git submodule update --remote --force