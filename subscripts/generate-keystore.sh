openssl pkcs12 -export -in certs/$1.crt -inkey pvt_keys/$1.key -chain -CAfile certs/ca-chain.pem -name $1 -out keystore/$1.pkcs12 -password pass:$2
