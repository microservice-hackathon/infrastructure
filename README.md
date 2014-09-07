ansible-microservice-hackathon
==============================

During the WarsJava microservice hackathon we will need to provision:

## log monitoring (log server)
- elasticsearch
- redis
- logstash
- kibana

## metrics collecting (metrics server)
- graphite
- graphana

## microservice related stuff (app server)
- zookeeper
- logstash-forwarder

## deployment related infrastructure: (deploy server)
- nexus

# Playbooks:

## Log monitoring

After provisioning just access __http://IP_OF_YOUR_HOST__ with __mylogger__ username and __mylogger__ pass

### Instalation

If you provide tag 

```
-t loggers 
```
then you'll provision the module as a whole.

Example of a command to run it (assuming that you have a __host__ inventory file):

```
ansible-playbook -i hosts microservice_hackathon.yml -vvvv -t "loggers"
```

#### SSL keys
Generate SSL keys by running:

```
openssl req -x509 -batch -nodes -newkey rsa:2048 -keyout logstash-forwarder.key -out logstash-forwarder.crt
```

Copy the resultant .key and .crt files to 

```
$ROOT/files/certs

```
You can also execute the provided script to do that:

```
generate_keys.sh
```

## Metrics monitoring

After provisioning you can access
- __graphite__ at __http://IP_OF_YOUR_HOST__
- __graphana__ at __http://IP_OF_YOUR_HOST:8080__

### Instalation
You have to provide graphite url as presented below (even if it is the same address as the server you are provisioning):

```
--extra-vars graphite_url=IP_OF_YOUR_HOST 
```

to provision these modules. If you provide tag 

```
-t graphite 
```
then you'll provision the module as a whole.

Example of a command to run it (assuming that you have a __host__ inventory file) with __graphite_url__ variable:

```
ansible-playbook -i hosts microservice_hackathon.yml -vvvv -t "graphite" --extra-vars graphite_url=59.98.12.123
```

## Applications

Example of a command to run it (assuming that you have a __host__ inventory file) with __graphite_url__ variable:

```
ansible-playbook -i hosts microservice_hackathon.yml -vvvv -t "apps" --extra-vars logstash_domain=59.98.12.123
```

### JDK8
playbook from: https://gist.github.com/gbirke/8314571

### logstash forwarder
installed as a service that logs to syslog

## Deployment - nexus

After provisioning you can access Nexus at __http://IP_OF_YOUR_HOST:8081/nexus/#welcome__

### Installation

If you provide tag 

```
-t nexus 
```
then you'll provision the module as a whole.

Example of a command to run it (assuming that you have a __host__ inventory file):

```
ansible-playbook -i hosts microservice_hackathon.yml -vvvv -t "loggers"
```


Playbook origins
_____________________________

## Log monitoring

playbook from: https://github.com/valentinogagliardi/ansible-logstash

### elastic-search
playbook from: https://github.com/valentinogagliardi/ansible-logstash

### redis
playbook from: https://github.com/valentinogagliardi/ansible-logstash

### logstash
playbook from: https://github.com/valentinogagliardi/ansible-logstash

## Applications

### JDK8
playbook from: https://gist.github.com/gbirke/8314571

### logstash forwarder
playbook from: https://github.com/WeAreFarmGeek/ansible-logstash-forwarder
configuration: /etc/logstash-forwarder
installed as a service that logs to syslog

## Deployment

### nexus
playbook from: https://github.com/marcingrzejszczak/ansible-sonatype-nexus
