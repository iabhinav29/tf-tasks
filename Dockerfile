FROM gradle:7.6-jdk as build
RUN mkdir -p /home/source/java
COPY /demo /home/source/java
WORKDIR /home/source/java
USER root
RUN chown -R gradle /home/source/java
USER gradle
RUN gradle clean build

FROM openjdk:17.0.1-jdk-slim
RUN adduser --system --group app-user
COPY --from=build --chown=app-user:app-user /home/source/java/build/libs/*.jar app.jar
EXPOSE 8080
ENTRYPOINT [ "java", "-jar", "app.jar"]