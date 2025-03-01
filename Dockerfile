FROM golang:1.12-alpine3.9

ENV ENTRYPOINT_CMD="noverify -stubs-dir=/root/phpstorm-stubs -cache-dir=/tmp/cache/noverify /project"

RUN apk update && apk --update add \
    git

RUN git clone https://github.com/JetBrains/phpstorm-stubs /root/phpstorm-stubs && \
    go get -u github.com/VKCOM/noverify

ENTRYPOINT $ENTRYPOINT_CMD
