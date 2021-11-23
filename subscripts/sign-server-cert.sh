openssl x509 -req -days 3650 -in csr/$1.csr -CA certs/ca.crt -CAkey pvt_keys/ca.key -CAcreateserial -out certs/$1.crt -extfile cfg/$1.cfg -extensions v3_req
