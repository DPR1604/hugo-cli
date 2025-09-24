FROM alpine:3.22.1

ARG HUGO_VERSION=0.134.3
ARG TEMP=/tmp

RUN apk add \
wget \ 
tar \
libc6-compat \
libstdc++

RUN wget -O "${TEMP}/hugo.tar.gz" "https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_linux-amd64.tar.gz" && \
tar -xzvf "${TEMP}/hugo.tar.gz" -C /usr/bin/ hugo

RUN mkdir /src # Create directory to mount site files to
WORKDIR /src

ENTRYPOINT ["hugo"]
