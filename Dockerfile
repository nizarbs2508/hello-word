# Use a base image
FROM ubuntu:latest

# Install necessary packages (e.g., OpenJDK)
RUN apt-get update && apt-get install -y openjdk-11-jdk

# Set the working directory
WORKDIR /app

# Copy application files to the container
COPY . .

# Expose a port (if necessary)
EXPOSE 8080

# Set the command to run your application (if necessary)
CMD ["java", "-jar", "hello-word.jar"]


