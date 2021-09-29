FROM openjdk:16-jdk-alpine

# ENV APP_ARTIFACT_CANONICAL_NAME workout-library
# ENV APP_HOME_PARENT opt/app
# ENV APP_HOME $APP_HOME_PARENT/$APP_ARTIFACT_CANONICAL_NAME

COPY --from=build $APP_HOME/target/workout-library-1.0.0-SNAPSHOT.jar app.jar
COPY --from=build $APP_HOME/target/classes/application.properties /conf/application.properties

EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar", "--spring.config.location=/conf/application.properties"]
