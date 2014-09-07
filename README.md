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

After provisioning just access http://IP_OF_YOUR_HOST with __mylogger__ username and __mylogger__ pass

### Instalation

If you provide tag 

```
-t loggers 
```
then you'll provision the module as a whole.


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

### Instalation
You have to provide 

```
--extra-vars target=IP_OF_YOUR_HOST 
```

to provision these modules. If you provide tag 

```
-t graphite 
```
then you'll provision the module as a whole.

After provisioning you can access
- graphite at http://IP_OF_YOUR_HOST
- graphana at http://IP_OF_YOUR_HOST:8080

### graphite + grafana
playbook from: https://github.com/marcingrzejszczak/ansible-graphite-graphana

## Applications

### JDK8
playbook from: https://gist.github.com/gbirke/8314571

### logstash forwarder
installed as a service that logs to syslog

## Deployment

### nexus
playbook from: https://github.com/marcingrzejszczak/ansible-sonatype-nexus

## Playbook origins

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
