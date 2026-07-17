

FROM eclipse-temurin:21-jdk

WORKDIR /app

COPY . .

RUN chmod +x mvnw || true

RUN ./mvnw clean package || mvn clean package

COPY target/*.jar app.jar

EXPOSE 8080

CMD ["java","-jar","app.jar"]

