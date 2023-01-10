FROM openjdk:8-jre

# Install OpenJDK-11
RUN apt-get update && \
    apt-get install -y openjdk-8-jre && \
    apt-get clean;

ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/

RUN export JAVA_HOME

# RUN cd /usr/lib/jvm/java-1.8-openjdk/jre/lib/security && \
# 	echo 'security.provider.11=org.bouncycastle.jce.provider.BouncyCastleProvider' >> /usr/lib/jvm/java-1.8-openjdk/jre/lib/security/java.security && \
# 	echo 'security.provider.12=com.ncipher.provider.km.nCipherKM' >> /usr/lib/jvm/java-1.8-openjdk/jre/lib/security/java.security

# copy the packaged jar file into our docker image
# COPY kms7500.jar /kms7500.jar
# COPY lib/local_policy.jar /usr/lib/jvm/java-1.8-openjdk/jre/lib/security
# COPY lib/US_export_policy.jar /usr/lib/jvm/java-1.8-openjdk/jre/lib/security
# COPY lib/bcprov-jdk15on-165.jar /usr/lib/jvm/java-1.8-openjdk/jre/lib/ext
# COPY lib/nCipherKM.jar /usr/lib/jvm/java-1.8-openjdk/jre/lib/ext
#COPY storage/config/tte.properties /storage/config

# CMD ["java", "-jar", "/kms7500.jar"]
