# Use the official Maven image as a parent image
FROM maven:3.8.3-openjdk-17-slim AS build

# Set the working directory in the container
WORKDIR /app

# Copy the project's files into the container
COPY . .

# Build the project using Maven
RUN mvn package

# Use another base image for the final runtime image
FROM eclipse-temurin:17-jre

# Set the working directory in the runtime container
WORKDIR /app

# Copy the JAR file built in the previous stage to the runtime container
COPY --from=build /app/target/fastmemoryallocator-0.1-jar-with-dependencies.jar .

# Set the default command to run your Java application
CMD ["java", "-jar", "fastmemoryallocator-0.1-jar-with-dependencies.jar"]