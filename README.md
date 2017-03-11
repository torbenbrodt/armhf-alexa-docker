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
```

### To complete your own image
Go into bash mode

```bash
$ docker run -ti torbenbrodt/armhf-alexa /bin/bash
```

Change the IDs and secrets to the ones you got from the Amazon registration.
```bash
sed -ie 's/=YOUR_PRODUCT_ID_HERE/=raspi3_01/g' /root/alexa-avs-sample-app/automated_install.sh
sed -ie 's/=YOUR_CLIENT_ID_HERE/=amzn1.application-XXX/g' /root/alexa-avs-sample-app/automated_install.sh
sed -ie 's/=YOUR_CLIENT_SECRET_HERE/=XXX/g' /root/alexa-avs-sample-app/automated_install.sh
```

And then start the compilation
```bash
$ . /root/alexa-avs-sample-app/automated_install.sh
```
Afterwards commit your changes
```bash
# docker ps
# docker commit <CONTAINER-ID> torbenbrodt/armhf-alexa
```

### To run the demo, do the following in 3 seperate terminals:
```bash
Run the companion service: cd /root/alexa-avs-sample-app/samples/companionService && npm start
Run the AVS Java Client: cd /root/alexa-avs-sample-app/samples/javaclient && mvn exec:exec
Run the wake word agent: 
  Sensory: cd /root/alexa-avs-sample-app/samples/wakeWordAgent/src && ./wakeWordAgent -e sensory
  KITT_AI: cd /root/alexa-avs-sample-app/samples/wakeWordAgent/src && ./wakeWordAgent -e kitt_ai
  GPIO: PLEASE NOTE -- If using this option, run the wake word agent as sudo:
  cd /root/alexa-avs-sample-app/samples/wakeWordAgent/src && sudo ./wakeWordAgent -e gpio
```

### You will end up with a Headless Exception
Unfortunately the current version of Alexa needs a browser to do oauth authenticiation.
This could be achieved with a VNC server, but still it requires a new authentication after every restart.

The current Docker container cannot be used!

We all hope there will be command line version soon. Please follow https://github.com/alexa/alexa-avs-sample-app/issues/143

