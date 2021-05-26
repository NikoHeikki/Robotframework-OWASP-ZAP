#!/bin/bash

docker-compose up -d owasp-zap

sleep 25

if [ -f "./owasp-zap-root.pem" ]; then
    echo "Removing old certificate file"
fi
echo Getting OWASP ZAP root certificate
curl http://localhost:8080/OTHER/core/other/rootcert > owasp-zap-root.pem

echo Building selenium image and importing owasp cert

docker build -t elgalu/selenium:latest .

docker-compose up -d
