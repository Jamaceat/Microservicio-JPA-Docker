FROM openjdk:17
ADD crud-jpa.jar crud-jpa.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/crud-jpa.jar"]