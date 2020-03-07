FROM alpine

RUN apk update && \
    apk add --no-cache ca-certificates tzdata && \
    update-ca-certificates

COPY bin/server /go/bin/server
COPY bin/memspool /go/bin/memspool
COPY bin/panda_server /go/bin/panda_server
COPY bin/echo   /go/bin/echo_server

# Expose the application port
# EXPOSE 8181

# create a volume for the configuration persistence
VOLUME /conf

# This form of ENTRYPOINT allows the process to catch signals from the `docker stop` command
ENTRYPOINT /go/bin/server -f /conf/katzenpost.toml
