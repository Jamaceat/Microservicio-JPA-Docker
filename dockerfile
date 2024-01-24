FROM openjdk:17
ADD crud-jpa.jar crudlibros.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/crud-jpa.jar"]