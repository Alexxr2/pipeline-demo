FROM eclipse-temurin:17-jre
ARG JAR_FILE=target/pipeline-demo-1.0-SNAPSHOT.jar
COPY ${JAR_FILE} app.jar
ENTRYPOINT ["java","-jar","/app.jar"]