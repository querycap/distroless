# Custom builds for distroless

Mirror for https://github.com/GoogleContainerTools/distroless

Only support:

* `querycapdistroless/static-debian10`
    * `:latest` ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/querycapdistroless/static-debian10/latest)
    * `:nonroot` ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/querycapdistroless/static-debian10/nonroot)

* `querycapdistroless/base-debian10`
    * `:latest` ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/querycapdistroless/base-debian10/latest)
    * `:nonroot` ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/querycapdistroless/base-debian10/nonroot)    
    * `:debug` ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/querycapdistroless/base-debian10/debug)    
    * `:debug-nonroot` ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/querycapdistroless/base-debian10/debug-nonroot)    

* `querycapdistroless/cc-debian10`
    * `:latest` ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/querycapdistroless/cc-debian10/latest)
    * `:nonroot` ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/querycapdistroless/cc-debian10/nonroot)    
    * `:debug` ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/querycapdistroless/cc-debian10/debug)    
    * `:debug-nonroot` ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/querycapdistroless/cc-debian10/debug-nonroot)        

* `querycapdistroless/nodejs-debian10`
    * `:10` ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/querycapdistroless/nodejs-debian10/10)
    * `:10-debug` ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/querycapdistroless/nodejs-debian10/10-debug)
    * `:12` ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/querycapdistroless/nodejs-debian10/12)
    * `:12-debug` ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/querycapdistroless/nodejs-debian10/12-debug)
    * `:14` ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/querycapdistroless/nodejs-debian10/14)
    * `:14-debug` ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/querycapdistroless/nodejs-debian10/14-debug)

## Local build

install bazelish

```
go get github.com/bazelbuild/bazelisk

mv $(go env GOPATH)/bin/bazelisk $(go env GOPATH)/bin/bazel
```

run debug

`make`