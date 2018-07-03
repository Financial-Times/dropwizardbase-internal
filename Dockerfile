FROM alpine:3.7
RUN apk update \
  && apk add openjdk8 maven \
  && rm -rf /var/cache/apk/*
ADD settings.xml /root/.m2/
