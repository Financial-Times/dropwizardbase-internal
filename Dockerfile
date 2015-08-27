FROM alpine:3.2
ADD pom.xml /
ADD http://git.svc.ft.com/projects/FP/repos/ft-toolbox/browse/files/settings.xml?at=ca798f77a173aa200ec7a5382a2126133c44d725&raw /root/.m2/settings.xml
RUN echo "@testing http://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
  && apk --update add tar ca-certificates openjdk8@testing \
  && wget http://www.webhostingjams.com/mirror/apache/maven/maven-3/3.3.3/binaries/apache-maven-3.3.3-bin.tar.gz \
  && tar xf apache-maven-3.3.3-bin.tar.gz \
  && ln -sf /apache-maven-3.3.3/bin/mvn /usr/bin/mvn \
  && mvn verify \
  && apk del tar \
  && rm -rf /apache-maven-3.3.3-bin.tar.gz \
  && rm -rf /var/cache/apk/*

