FROM fabric8/java-alpine-openjdk11-jre
WORKDIR /usr/src/app
COPY target/jb-hello-world-maven-0.1.0-shaded.jar ./jb-hello-world-maven-0.1.0-shaded.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "jb-hello-world-maven-0.1.0-shaded.jar"]
