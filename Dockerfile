FROM openjdk:22
LABEL authors="CHIEN"
WORKDIR /opt
ENV PORT 8080
EXPOSE 8080
COPY target/*.jar /opt/app.jar
COPY .mvn/ .mvn
COPY pom.xml ./
COPY src ./src
ENTRYPOINT exec java $JAVA_OPTS -jar app.jar
