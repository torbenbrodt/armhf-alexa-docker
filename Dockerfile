FROM resin/rpi-raspbian:jessie
MAINTAINER Torben Brodt <t.brodt@gmail.com>

RUN apt-get update
RUN apt-get install git vim

WORKDIR /root
RUN git clone https://github.com/alexa/alexa-avs-sample-app.git
