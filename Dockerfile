FROM resin/rpi-raspbian:jessie
MAINTAINER Torben Brodt <t.brodt@gmail.com>

RUN apt-get update
RUN apt-get install git vim oracle-java8-jdk wget

WORKDIR /root
RUN git clone https://github.com/alexa/alexa-avs-sample-app.git

#RUN /root/alexa-avs-sample-app/automated_install.sh
