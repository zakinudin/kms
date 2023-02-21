FROM ubuntu:latest

RUN apt-get update && \
    apt-get install -y nano && \
    apt-get install -y unzip && \
    apt-get install -y openjdk-8-jre

# WORKDIR /home

COPY /SW-12.71/ /home/Project/ubuntu/security_world_12_71

RUN tar -C / -xf /security_world_12_71/ctd.tar.gz && tar -C / -xf /security_world_12_71/ctls.tar.gz && tar -C / -xf /security_world_12_71/devref.tar.gz && tar -C / -xf /security_world_12_71/hwsp.tar.gz && tar -C / -xf /security_world_12_71/javasp.tar.gz && tar -C / -xf /security_world_12_71/jd.tar.gz && tar -C / -xf /security_world_12_71/ncsnmp.tar.gz && tar -C / -xf /security_world_12_71/raserv.tar.gz