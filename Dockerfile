FROM maven:3.5.2-jdk-8-alpine AS MAVEN_BUILD
MAINTAINER Max Kornyev
COPY . /build/
WORKDIR /build/
RUN mvn package
FROM openjdk:8-jre-alpine
WORKDIR /build/
EXPOSE 8080
COPY --from=MAVEN_BUILD /build/target/spring-petclinic-2.3.0.BUILD-SNAPSHOT.jar /build/
ENTRYPOINT ["java", "-jar", "spring-petclinic-2.3.0.BUILD-SNAPSHOT.jar"]
