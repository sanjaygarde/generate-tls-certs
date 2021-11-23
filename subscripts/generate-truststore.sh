keytool -keystore truststore/truststore.pkcs12 -alias CARoot -import -file certs/ca.crt -storepass $1  -noprompt -storetype PKCS12
