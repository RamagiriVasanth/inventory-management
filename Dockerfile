# Use an official Java runtime as a parent image
FROM openjdk:17-jdk-slim

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container
COPY . /app

# Build the application using Maven
RUN ./mvnw clean install

# Run the application
CMD ["java", "-jar", "target/inventory-management-0.0.1-SNAPSHOT.jar"]
