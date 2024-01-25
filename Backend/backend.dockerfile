FROM eclipse-temurin:17-jdk-alpine
ADD crud-jpa.jar crud-jpa.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/crud-jpa.jar"]