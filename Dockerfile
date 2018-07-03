FROM alpine:3.7
#ADD pom.xml /
RUN apk update \
  && apk add ca-certificates openjdk8 maven \
#  && find /etc/ssl/certs -name "*.pem" | xargs -I {} keytool -import -alias {} -keystore /usr/lib/jvm/java-1.8-openjdk/jre/lib/security/cacerts -file {} -noprompt -storepass changeit \
#  && mvn verify \
  && rm -rf /var/cache/apk/*
ADD settings.xml /root/.m2/
