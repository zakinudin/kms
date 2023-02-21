FROM ubuntu:latest

RUN apt-get update && \
    apt-get install -y nano && \
    apt-get install -y unzip

