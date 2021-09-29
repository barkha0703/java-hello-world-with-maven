FROM openjdk:16-jdk-alpine

# ENV APP_ARTIFACT_CANONICAL_NAME workout-library
# ENV APP_HOME_PARENT opt/app
# ENV APP_HOME $APP_HOME_PARENT/$APP_ARTIFACT_CANONICAL_NAME

ADD ./home/runner/work/java-hello-world-with-maven/java-hello-world-with-maven/target/ /usr/local/ 
WORKDIR /home/runner/work/java-hello-world-with-maven/java-hello-world-with-maven/target/
COPY jb-hello-world-maven-0.1.0-shaded.jar opt/app/app.jar
#COPY --from=build /home/runner/work/java-hello-world-with-maven/java-hello-world-with-maven/target/classes/application.properties /conf/application.properties

WORKDIR /opt/app

EXPOSE 8080
#ENTRYPOINT ["java", "-jar", "app.jar", "--spring.config.location=/conf/application.properties"]
ENTRYPOINT ["java","-jar","app.jar"]
