# Use a Maven image with OpenJDK 17
FROM maven:3.8.4-openjdk-17-slim AS builder

# Set the working directory inside the container
WORKDIR /app

# Copy the project files to the working directory
COPY . .

# Run Maven to build the project
RUN mvn clean install

# Use a Java 17 image to run the application
FROM openjdk:17-slim

# Copy the built .jar file from the builder stage to the running container
COPY --from=builder /app/target/inventory-management-0.0.1-SNAPSHOT.jar /inventory-management.jar

# Run the Spring Boot application
ENTRYPOINT ["java", "-jar", "/inventory-management.jar"]
