# armhf-alexa-docker
Alexa voice control Docker file for armhv (e.g. rpi3) based on ubuntu linux.

The steps are incomplete.

### Register for an Amazon developer account
Please follow instructions at https://github.com/alexa/alexa-avs-sample-app/wiki/Raspberry-Pi

### Build your own image
```bash
$ git clone https://github.com/torbenbrodt/armhf-alexa-docker.git
$ cd armhf-alexa-docker
$ docker build -t torbenbrodt/armhf-alexa .
$ docker run -ti torbenbrodt/armhf-alexa /bin/bash
```

### To complete your own image
Install within Docker
```bash
$ . /root/alexa-avs-sample-app/automated_install.sh
```

### While at the same time commit your changes
```bash
# docker ps
# docker commit <CONTAINER-ID> torbenbrodt/armhf-alexa
```
