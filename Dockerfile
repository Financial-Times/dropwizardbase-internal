FROM up-registry.ft.com/coco/javabase
ADD pom.xml /
RUN mvn verify
