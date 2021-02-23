#!/bin/pwsh
openssl req -x509 -config openssl-ca.cnf -newkey rsa:4096 -sha256 -days 3650 -nodes -out cacert.pem -outform PEM