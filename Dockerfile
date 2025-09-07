# Use OpenJDK as base image
FROM openjdk:18-jdk-slim

# Set working directory
WORKDIR /app

# Copy Maven wrapper & pom.xml first (for caching dependencies)
COPY mvnw .
COPY .mvn .mvn
COPY pom.xml .

# Make Maven wrapper executable (important for Linux base images)
RUN chmod +x mvnw

# Download dependencies
RUN ./mvnw dependency:go-offline -B

# Copy the rest of the project
COPY src ./src

# Build the application
RUN ./mvnw clean package -DskipTests

# Expose port 8080
EXPOSE 8080

# Run the application
CMD ["java", "-jar", "target/calculator-0.0.1-SNAPSHOT.jar"]