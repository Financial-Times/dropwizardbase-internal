FROM alpine:3.2
ADD pom.xml /
RUN echo "@testing http://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
  && apk --update add tar ca-certificates openjdk8@testing \
  && wget http://www.webhostingjams.com/mirror/apache/maven/maven-3/3.3.3/binaries/apache-maven-3.3.3-bin.tar.gz \
  && tar xf apache-maven-3.3.3-bin.tar.gz \
  && ln -sf /apache-maven-3.3.3/bin/mvn /usr/bin/mvn \
  && find /etc/ssl/certs -name "*.pem" | xargs -I {} keytool -import -alias {} -keystore /usr/lib/jvm/java-1.8-openjdk/jre/lib/security/cacerts -file {} -noprompt -storepass changeit \
  && mvn verify \
  && apk del tar \
  && rm -rf /apache-maven-3.3.3-bin.tar.gz \
  && rm -rf /var/cache/apk/*

