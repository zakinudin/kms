FROM ubuntu:latest

RUN apt-get update && \
    apt-get install -y nano && \
    apt-get install -y unzip && \
    apt-get install -y openjdk-8-jre

COPY /SW-12.71/ /home/Project/ubuntu/security_world_12_71
COPY lib/nCipherKM.jar /usr/lib/jvm/java-8-openjdk-amd64/jre/lib/ext/
COPY lib/local_policy.jar /usr/lib/jvm/java-8-openjdk-amd64/jre/lib/security
COPY lib/US_export_policy.jar /usr/lib/jvm/java-8-openjdk-amd64/jre/lib/security
COPY lib/bcprov-jdk15on-165.jar /usr/lib/jvm/java-8-openjdk-amd64/jre/lib/ext

# RUN security_world_12_71/install-sw.sh; exit 0

RUN /bin/bash /home/Project/ubuntu/security_world_12_71/install-sw.sh

CMD ["/opt/nfast/sbin/install"]
