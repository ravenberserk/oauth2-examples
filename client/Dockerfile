FROM openjdk:11-jre
MAINTAINER Javier Grande Pérez <raven.berserk@gmail.com>

ADD ./target/client.jar /app/
CMD ["java", "-Xmx200m", "-jar", "/app/client.jar"]

EXPOSE 8081