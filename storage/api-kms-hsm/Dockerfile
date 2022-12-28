# we will use openjdk 8 with alpine as it is a very small linux distro
FROM openjdk:8-jre-alpine

# copy the packaged jar file into our docker image
COPY api-hsm.jar /api-hsm.jar

# set the startup command to execute the jar
CMD ["java", "-jar", "/api-hsm.jar"]
