ansible-microservice-hackathon
==============================

# Repository contains playbooks that provision

## microservice related infrastructure:
- elasticsearch
- redis
- logstash
- kibana
- logstash-forwarder
- graphite
- graphana
- zookeeper

## deployment related infrastructure:
- nexus

# Playbooks origin:

## elastic-search
playbook from: https://github.com/valentinogagliardi/ansible-logstash

## redis
playbook from: https://github.com/valentinogagliardi/ansible-logstash

## logstash
playbook from: https://github.com/valentinogagliardi/ansible-logstash

### SSL keys
Generate SSL keys by running:

```
openssl req -x509 -batch -nodes -newkey rsa:2048 -keyout logstash-forwarder.key -out logstash-forwarder.crt
```

Copy the resultant .key and .crt files to roles/logstash/files/certs.

## kibana + nginx
playbook from: https://github.com/valentinogagliardi/ansible-logstash
