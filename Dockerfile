FROM maven:3.8.2-openjdk-16-slim AS build

# app and environment variables
ENV APP_ARTIFACT_CANONICAL_NAME workout-library
ENV APP_ARTIFACT $APP_ARTIFACT_CANONICAL_NAME.jar
ENV APP_HOME_PARENT /apps
ENV APP_HOME $APP_HOME_PARENT/$APP_ARTIFACT_CANONICAL_NAME

COPY src $APP_HOME/src
COPY pom.xml $APP_HOME

RUN mvn -f $APP_HOME/pom.xml clean package

FROM openjdk:16-jdk-alpine

COPY --from=build $APP_HOME/target/workout-library-1.0.0-SNAPSHOT.jar app.jar
COPY --from=build $APP_HOME/target/classes/application.properties /conf/application.properties

EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar", "--spring.config.location=/conf/application.properties"]
