FROM fabric8/java-alpine-openjdk11-jre
WORKDIR /usr/src/app
COPY target/loadbalancer.jar ./loadbalancer.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "loadbalancer.jar"]
