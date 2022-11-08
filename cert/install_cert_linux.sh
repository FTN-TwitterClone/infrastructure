#!/bin/bash
sudo cp ./twitter_ca/ca-cert.pem /usr/local/share/ca-certificates/twitter-ca.crt
sudo update-ca-certificates