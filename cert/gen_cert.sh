#!/bin/bash
#taken from: https://mariadb.com/docs/security/data-in-transit-encryption/create-self-signed-certificates-keys-openssl/

#generate CA key
openssl genrsa 2048 > ca-key.pem
#generate CA certificate
openssl req -new -x509 -nodes -days 365 -key ca-key.pem -out ca-cert.pem

#generate server key and certificate req
openssl req -newkey rsa:2048 -nodes -days 365 -keyout server-key.pem -out server-req.pem
#generate server cert
openssl x509 -req -days 365 -set_serial 01 -in server-req.pem -out server-cert.pem -CA ca-cert.pem -CAkey ca-key.pem -extfile cert/v3.ext
