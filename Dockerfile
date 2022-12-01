# we will use openjdk 8 with alpine as it is a very small linux distro
FROM openjdk:8-jre-alpine3.9

# copy the packaged jar file into our docker image
COPY api-no-kms.jar /api-no-kms.jar
COPY lib/local_policy.jar /usr/lib/jvm/java-1.8-openjdk/jre/lib/security
COPY lib/US_export_policy.jar /usr/lib/jvm/java-1.8-openjdk/jre/lib/security
COPY lib/bcprov-jdk15on-165.jar /usr/lib/jvm/java-8-openjdk-amd64/jre/lib/ext

# create folder storage/.....
RUN mkdir -p storage \
    mkdir -p storage/p12 \
    mkdir -p storage/keystore \
    mkdir -p storage/doctosign \
    mkdir -p storage/signeddoc \
    mkdir -p storage/imageseal \
    mkdir -p storage/imagesignature

# install bc provider

# set the startup command to execute the jar
# CMD ["java", "-jar", "/api-no-kms.jar"]