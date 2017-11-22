FROM swift:4 as builder

RUN set -e -x \
    && apt-get update \
    && apt-get -y install \
        curl \
        bash \
    && (curl -s https://packagecloud.io/install/repositories/tarantool/1_7/script.deb.sh | bash) \
    && apt-get -y install tarantool \
    && rm -rf /var/lib/apt/lists/*

ARG CONFIGURATION=release

COPY swift /swift
RUN set -e -x \
    && cd /swift \
    && swift build -c ${CONFIGURATION} \
    && mkdir -p /usr/local/lib/tarantool \
    && cp /swift/.build/${CONFIGURATION}/libtest_loading_library.so /usr/local/lib/tarantool/libtest_loading_library.so

COPY tarantool/*.lua /usr/local/share/tarantool/

CMD [ "bash" ]
