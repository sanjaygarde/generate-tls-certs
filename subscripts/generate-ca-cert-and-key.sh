openssl req -new -nodes -x509 -days 3650 -newkey rsa:2048 -keyout pvt_keys/ca.key -out certs/ca.crt -config cfg/ca.cfg
