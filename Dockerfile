FROM alpine:3.2
ADD pom.xml /
ADD http://git.svc.ft.com/projects/FP/repos/ft-toolbox/browse/files/settings.xml?at=ca798f77a173aa200ec7a5382a2126133c44d725&raw /root/.m2/settings.xml
RUN echo "@testing http://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
  && apk --update add ca-certificates maven@testing openjdk7 \
  && ln -s /usr/share/java/maven-3.3.3/bin/mvn /usr/bin/ \
  && rm /usr/lib/jvm/java-1.7-openjdk/jre/lib/security/cacerts \
  && find /etc/ssl/certs -name "*.pem" | xargs -I {} keytool -import -alias {} -keystore /usr/lib/jvm/java-1.7-openjdk/jre/lib/security/cacerts -file {} -noprompt -storepass changeit \
  && mvn verify \
  && rm -rf /var/cache/apk/*

