FROM alpine:3.2
ADD pom.xml /
ADD http://git.svc.ft.com/projects/FP/repos/ft-toolbox/browse/files/settings.xml?at=ca798f77a173aa200ec7a5382a2126133c44d725&raw /root/.m2/settings.xml
RUN apk --update add tar ca-certificates \
  && wget http://www.webhostingjams.com/mirror/apache/maven/maven-3/3.3.3/binaries/apache-maven-3.3.3-bin.tar.gz \
  && tar xf apache-maven-3.3.3-bin.tar.gz \
  && ln -sf /apache-maven-3.3.3/bin/mvn /usr/bin/mvn \
  #&& rm /usr/lib/jvm/java-1.7-openjdk/jre/lib/security/cacerts \
  #&& find /etc/ssl/certs -name "*.pem" | xargs -I {} keytool -import -alias {} -keystore /usr/lib/jvm/java-1.7-openjdk/jre/lib/security/cacerts -file {} -noprompt -storepass changeit \
  && mvn verify \
  && apk del tar \
  && rm -rf /var/cache/apk/*

