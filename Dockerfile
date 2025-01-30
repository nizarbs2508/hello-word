# Use openjdk base image
FROM openjdk:17-jdk-slim
VOLUME /tmp
COPY target/demo-1.0.jar demo-1.0.jar
ENTRYPOINT ["java", "-jar", "/demo-1.0.jar"]

