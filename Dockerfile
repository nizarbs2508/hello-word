# Use openjdk base image
FROM openjdk:17-jdk-slim
VOLUME /tmp
COPY target/demo-1.0.jar hello-word.jar
ENTRYPOINT ["java", "-jar", "/hello-word.jar"]

