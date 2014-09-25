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

After provisioning just access __http://kibana.warsjawa.uservices.pl__.

### Provisioning

```
ansible-playbook -i inventory site.yml -vvvv --limit loggers
```

## Metrics monitoring

After provisioning you can access

 - __graphite__ at __http://graphite.warsjawa.uservices.pl__
 - __graphana__ at __http://grafana.warsjawa.uservices.pl__

### Provisioning

```
ansible-playbook -i inventory site.yml -vvvv --limit graphite
```

## Applications

```
ansible-playbook -i inventory site.yml -vvvv --limit apps
```

### JDK8

Oracle JDK 8u5.

### logstash forwarder

Installed as a service that logs to syslog.

## Deployment - nexus

After provisioning you can access Nexus at __http://nexus.warsjawa.uservices.pl:8081/nexus/#welcome__

### Installation

```
ansible-playbook -i inventory site.yml -vvvv --limit loggers
```

Playbook origins
================

 - ELK stack - https://github.com/valentinogagliardi/ansible-logstash
 - Oracle JDK - https://github.com/wybczu/ansible_oracle_jdk
 - logstash forwarder -  https://github.com/WeAreFarmGeek/ansible-logstash-forwarder
 - nexus - https://github.com/marcingrzejszczak/ansible-sonatype-nexus
