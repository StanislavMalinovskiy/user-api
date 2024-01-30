# Part 1: build
FROM maven:3.8.4-openjdk-17 as BUILD
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package

# Part 1: create image
FROM openjdk:17-slim
COPY --from=build /app/target/*.jar app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]
