FROM ubuntu:latest

RUN apt-get update && \
    apt-get install -y nano && \
    apt-get install -y unzip && \
    apt-get install -y openjdk-8-jre

COPY /home/hsm/SW-12.71/ /home

