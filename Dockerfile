# FROM ubuntu:20.04
FROM openjdk:8-jre-alpine3.9

RUN apk add --no-cache vim bash && rm -rf /var/cache/apk/*

RUN cd /usr/lib/jvm/java-1.8-openjdk/jre/lib/security && \
	echo 'security.provider.11=org.bouncycastle.jce.provider.BouncyCastleProvider' >> /usr/lib/jvm/java-1.8-openjdk/jre/lib/security/java.security
	# echo 'security.provider.12=com.ncipher.provider.km.nCipherKM' >> /usr/lib/jvm/java-1.8.0-openjdk-amd64/jre/lib/security/java.security

# copy the packaged jar file into our docker image
COPY provider.jar /provider.jar
# COPY lib/local_policy.jar /usr/lib/jvm/java-1.8.0-openjdk-amd64/jre/lib/security/local_policy.jar
# COPY lib/US_export_policy.jar /usr/lib/jvm/java-1.8.0-openjdk-amd64/jre/lib/security/US_export_policy.jar
# COPY lib/bcprov-jdk15on-165.jar /usr/lib/jvm/java-1.8.0-openjdk-amd64/jre/lib/ext/bcprov-jdk15on-165.jar
# COPY storage/config/tte.properties /storage/config

CMD ["java", "-jar", "/provider.jar"]
# ENTRYPOINT ["java", "-jar", "/kms7500.jar"]
