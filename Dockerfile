# Use an official OpenJDK runtime as a parent image
FROM openjdk:8-jre-alpine

# Set the shell to bash
# Source: https://stackoverflow.com/a/40944512/3128926
RUN apk update && apk add bash

# Install Maven
# Source: https://stackoverflow.com/a/59243474/3128926
RUN apk add --no-cache curl tar bash && \
    mkdir -p /usr/local/bin && \
    curl -fsSL -o /tmp/apache-maven.tar.gz https://apache.osuosl.org/maven/maven-3/3.8.2/binaries/apache-maven-3.8.2-bin.tar.gz \
    tar -xzf /tmp/apache-maven.tar.gz -C /tmp && \
    mv /tmp/apache-maven-3.8.2 /usr/local/bin/mvn && \
    rm -f /tmp/apache-maven.tar.gz && \
    ln -s /usr/local/bin/mvn/bin/mvn /usr/local/bin/mvn

# Set the working directory to /app
WORKDIR /app

# Copy the fat jar into the container at /app
COPY /target/docker-java-app-example.jar /app

# Make port 8080 available to the world outside this container
EXPOSE 8080

# Run the jar file when the container launches
CMD ["java", "-jar", "docker-java-app-example.jar"]
