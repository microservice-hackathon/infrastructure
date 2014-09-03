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

# Playbooks origin:

## Log monitoring

### elastic-search
playbook from: https://github.com/valentinogagliardi/ansible-logstash

### redis
playbook from: https://github.com/valentinogagliardi/ansible-logstash

### logstash
playbook from: https://github.com/valentinogagliardi/ansible-logstash

#### SSL keys
Generate SSL keys by running:

```
openssl req -x509 -batch -nodes -newkey rsa:2048 -keyout logstash-forwarder.key -out logstash-forwarder.crt
```

Copy the resultant .key and .crt files to 

```
$ROOT/files/certs

```

### kibana + nginx
playbook from: https://github.com/valentinogagliardi/ansible-logstash

## Metrics monitoring

### graphite + grafana
playbook from: https://github.com/marcingrzejszczak/ansible-graphite-graphana

## Applications

### logstash forwarder
playbook from: https://github.com/WeAreFarmGeek/ansible-logstash-forwarder
configuration: /etc/logstash-forwarder
installed as a service that logs to syslog

## Deployment

### nexus
playbook from: https://github.com/marcingrzejszczak/ansible-sonatype-nexus
