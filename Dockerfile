# Use an official OpenJDK runtime as a parent image
FROM openjdk:8-jre-alpine

# Set the shell to bash
# Source: https://stackoverflow.com/a/40944512/3128926
RUN apk update && apk add bash

# Set the working directory to /app
WORKDIR /app

# Copy the fat jar into the container at /app
COPY /target/docker-java-app-example.jar /app

# Make port 8080 available to the world outside this container
EXPOSE 8080

# Run the jar file when the container launches
CMD ["java", "-jar", "docker-java-app-example.jar"]
