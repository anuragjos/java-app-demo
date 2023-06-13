FROM openjdk:8-alpine
WORKDIR /app
COPY ./target/*.jar /app.jar
CMD ["java","-jar","app.jar"]


