FROM java:openjdk-8-jre-alpine
MAINTAINER jeff.tunessen@gmail.com

ARG VERSION=latest

ADD docker/bin /usr/local/bin
ADD https://dl.google.com/closure-compiler/compiler-${VERSION}.zip /tmp

RUN echo "configure /usr/local/bin" \
    && cd /tmp \
    && unzip /tmp/compiler-${VERSION}.zip \
    && chmod +x /tmp/* \
    && find /usr/local/bin -type f -name '*.sh' | while read f; do mv "$f" "${f%.sh}"; done \
    && chmod +x /usr/local/bin/*

ENTRYPOINT ["closure-compiler"]
CMD ["-"]