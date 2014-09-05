#!/bin/sh
openssl req -x509 -batch -nodes -newkey rsa:2048 -keyout files/certs/logstash-forwarder.key -out files/certs/logstash-forwarder.crt
