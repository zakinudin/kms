FROM ubuntu:latest

RUN apt-get update && \
    apt-get install -y nano && \
    apt-get install -y unzip && \
    apt-get install -y openjdk-8-jre

# WORKDIR /home

COPY /SW-12.71/ /home

