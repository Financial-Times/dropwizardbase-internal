Serves as a base image for ft java microservice images. It is built upon coco/javabase and adds common maven plugins and dependencies used in microservices.

Run `docker build --pull --no-cache -t coco/dropwizardbase-internal`. Then run `docker images`. You should find a new image coco/dropwizardbase.
