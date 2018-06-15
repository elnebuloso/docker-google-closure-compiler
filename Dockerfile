FROM java:openjdk-8-jre-alpine
MAINTAINER jeff.tunessen@gmail.com

ARG VERSION=latest

ADD docker/bin /usr/local/bin
ADD https://dl.google.com/closure-compiler/compiler-${VERSION}.zip /tmp

RUN echo "configure /usr/local/bin" \
    && mkdir -p /opt \
    && cd /opt \
    && unzip /tmp/compiler-${VERSION}.zip \
    && find /usr/local/bin -type f -name '*.sh' | while read f; do mv "$f" "${f%.sh}"; done \
    && chmod +x /usr/local/bin/* \
    && chmod +x /opt/* \
    && chmod +r /opt/*

ENTRYPOINT ["closure-compiler"]
CMD ["-"]