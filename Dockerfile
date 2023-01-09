# FROM ubuntu:20.04
FROM openjdk:8-jre

RUN apt update \
        && apt install -y \
            zip \
            nano

# RUN cd /usr/lib/jvm/java-1.8.0-openjdk-amd64/jre/lib/security && \
	# echo 'security.provider.11=org.bouncycastle.jce.provider.BouncyCastleProvider' >> /usr/lib/jvm/java-1.8.0-openjdk-amd64/jre/lib/security/java.security && \
	# echo 'security.provider.12=com.ncipher.provider.km.nCipherKM' >> /usr/lib/jvm/java-1.8.0-openjdk-amd64/jre/lib/security/java.security

# copy the packaged jar file into our docker image
COPY kms7500.jar /kms7500.jar
COPY lib/local_policy.jar /usr/lib/jvm/java-1.8-openjdk/jre/lib/security
COPY lib/US_export_policy.jar /usr/lib/jvm/java-1.8-openjdk/jre/lib/security
COPY lib/bcprov-jdk15on-165.jar /usr/lib/jvm/java-1.8-openjdk/jre/lib/ext
COPY storage/config/tte.properties /storage/config

# CMD ["java", "-jar", "/kms7500.jar"]
