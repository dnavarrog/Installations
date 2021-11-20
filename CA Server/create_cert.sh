#!/bin/bash
#Creado: 30/10/2021
#Autor: dnavarrog
cd /opt/certificados

openssl genrsa -out $1.key 4096
openssl req -new -key $1.key -out $1.csr
cp example.ext $1.ext
sed -i "s/example.home.lan/$1/g" $1.ext
openssl x509 -req -in $1.csr -CA CA.pem -CAkey CA.key -CAcreateserial -out $1.crt -days 365 -sha256 -extfile $1.ext