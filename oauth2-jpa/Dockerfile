FROM openjdk:11-jre
MAINTAINER Javier Grande Pérez <raven.berserk@gmail.com>

ADD ./target/oauth2-jpa.jar /app/
CMD ["java", "-Xmx200m", "-jar", "/app/oauth2-jpa.jar"]

EXPOSE 8080