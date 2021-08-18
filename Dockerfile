FROM golang:1.16.7-alpine3.14 AS builder

ENV XDD_GIT_URL https://github.com/cdle/xdd.git

# 编译xdd
# 安装xdd 目录为 /ql/xdd
RUN set -eux; \
    sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
    && apk update \
    && apk add --no-cache --virtual .build-deps git build-base \
    && mkdir /builder \
    && cd /builder \
    && git clone ${XDD_GIT_URL} \
    && cd xdd \
    && go build \
    && chmod 777 xdd

FROM whyour/qinglong:latest

ARG QL_VERSION

LABEL maintainer="gcdd1993 <gcwm99@gmail.com>"
LABEL qinglong_version="${QL_VERSION}"

RUN mkdir -p /ql/xdd

COPY docker-entrypoint.sh /ql/docker/docker-entrypoint.sh
COPY --from=builder /builder/xdd /ql/xdd/xdd

# 初始化生成目录 && fix "permission denied: unknown"
RUN set -eux; \
    mkdir -p /ql/xdd/xdd/conf \
    && chmod 777 /ql/xdd/xdd \
    && chmod +x /ql/docker/docker-entrypoint.sh

EXPOSE 5701
VOLUME /ql/xdd/conf

ENTRYPOINT ["./docker/docker-entrypoint.sh"]