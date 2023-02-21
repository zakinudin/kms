FROM ubuntu:latest
# WORKDIR /home/Project/ubuntu

COPY /SW-12.71/ /home/Project/ubuntu/security_world_12_71
COPY lib/nCipherKM.jar /usr/lib/jvm/java-8-openjdk-amd64/jre/lib/ext/
COPY lib/local_policy.jar /usr/lib/jvm/java-8-openjdk-amd64/jre/lib/security
COPY lib/US_export_policy.jar /usr/lib/jvm/java-8-openjdk-amd64/jre/lib/security
COPY lib/bcprov-jdk15on-165.jar /usr/lib/jvm/java-8-openjdk-amd64/jre/lib/ext

# RUN security_world_12_71/install-sw.sh; exit 0

RUN apt-get update && \
    apt-get install -y nano && \
    apt-get install -y unzip && \
    apt-get install -y openjdk-8-jre

RUN /bin/bash /home/Project/ubuntu/security_world_12_71/install-sw.sh; exit 0

CMD ["/opt/nfast/sbin/install"]

# RUN tar -C / -xf /security_world_12_71/ctd.tar.gz && tar -C / -xf /security_world_12_71/ctls.tar.gz && tar -C / -xf /security_world_12_71/devref.tar.gz && tar -C / -xf /security_world_12_71/hwsp.tar.gz && tar -C / -xf /security_world_12_71/javasp.tar.gz && tar -C / -xf /security_world_12_71/jd.tar.gz && tar -C / -xf /security_world_12_71/ncsnmp.tar.gz && tar -C / -xf /security_world_12_71/raserv.tar.gz