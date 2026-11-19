# ---------- build ----------
FROM maven:3.9-eclipse-temurin-21 AS build
WORKDIR /app
COPY pom.xml .
RUN mvn -B -q dependency:go-offline
COPY src ./src
RUN mvn -B -q package -DskipTests

# ---------- runtime ----------
FROM eclipse-temurin:21-jre
ENV TZ=America/Sao_Paulo     JAVA_OPTS="-XX:MaxRAMPercentage=75 -XX:+UseSerialGC -Xss512k"
WORKDIR /app
RUN useradd --system --uid 1001 vias
COPY --from=build /app/target/vias-api.jar app.jar
USER vias
EXPOSE 8080
# O Render informa a porta pela variavel PORT; o application.yml ja usa ${PORT:8080}
ENTRYPOINT ["sh", "-c", "java $JAVA_OPTS -jar app.jar"]
