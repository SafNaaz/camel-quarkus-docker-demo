# Stage 1: Build
FROM maven:3.9.3-eclipse-temurin-17 AS build
WORKDIR /app
COPY . .
RUN mvn package -DskipTests

# Stage 2: Run
FROM eclipse-temurin:17-jdk-alpine
WORKDIR /work/
COPY --from=build /app/target/quarkus-app/lib/ /work/lib/
COPY --from=build /app/target/quarkus-app/*.jar /work/
COPY --from=build /app/target/quarkus-app/app/ /work/app/
COPY --from=build /app/target/quarkus-app/quarkus/ /work/quarkus/
CMD ["java", "-jar", "quarkus-run.jar"]