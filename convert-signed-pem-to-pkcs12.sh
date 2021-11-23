openssl pkcs12 \
 -export \
 -inkey certs/$1.key \
 -in certs/$1.pem \
 -name $1 \
 -out certs/$1.pkcs12
