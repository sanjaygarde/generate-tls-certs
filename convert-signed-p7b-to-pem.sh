openssl pkcs7 \
 -in certs/$1.p7b \
 -out certs/$1.pem -print_certs
