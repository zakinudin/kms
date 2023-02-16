FROM openjdk:8-jdk

RUN apt update && apt install nano unzip

RUN cd /usr/local/openjdk-8/jre/lib/security && \
	echo 'security.provider.10=org.bouncycastle.jce.provider.BouncyCastleProvider' >> /usr/local/openjdk-8/jre/lib/security/java.security && \
	echo 'security.provider.11=com.ncipher.provider.km.nCipherKM' >> /usr/local/openjdk-8/jre/lib/security/java.security

# RUN cd /opt/nfast/bin && /opt/nfast/sbin/init.d-ncipher restart

# copy the packaged jar file into our docker image
COPY kms7500.jar /kms7500.jar
COPY lib/local_policy.jar /usr/local/openjdk-8/jre/lib/security
COPY lib/US_export_policy.jar /usr/local/openjdk-8/jre/lib/security
COPY lib/bcprov-jdk15on-165.jar /usr/local/openjdk-8/jre/lib/ext
COPY lib/nCipherKM.jar /usr/local/openjdk-8/jre/lib/ext
COPY lib/security_world /home/Project/lib/security_world
# COPY storage/config/tte.properties /storage/config

# CMD ["/opt/nfast/sbin/init.d-ncipher", "-D", "FOREGROUND"]
CMD ["java", "-jar", "/kms7500.jar"]
