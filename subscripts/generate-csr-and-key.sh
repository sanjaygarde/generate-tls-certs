openssl req -new -newkey rsa:2048 -keyout ./pvt_keys/$1.key -out ./csr/$1.csr -config ./cfg/$1.cfg -nodes
