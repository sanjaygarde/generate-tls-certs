# generate-tls-certs
Scripts for generating TLS certificates and related files such as keystore and truststore.

## Generating Certificate Signing Requests

`generate-signing-request.sh` allows you to generate a certificate signing request(CSR) for hosts/nodes enclosed in the node-list.txt. The CSR file can then be submitted to your Certificate Authority for signing your certificates.

`generate-signing-request.sh <node list file>`

## Generating Self Signed Certificates

When you want to use self signed certificates, us the shell script `generate-self-signed-certs.sh`. Before you can use this script make sure input is provided for each node in the ./cfg/\<Host FQDN Name\>.cfg file.

`generate-self-signed-certs.sh <node list file> <keystore password> <truststore password>`

## Converting the .p7b files to .pkcs12 format
Many a times your CA will provide you with a .p7b(pkcs7 format) file. The script `convert-signed-pem-to-pkcs12.sh` allows you to convert from the pksc7(.p7b) format to .pem(base64 format). Once the signed certs are in the pkcs7 format you can use the script `convert-signed-pem-to-pkcs12.sh` to convert that to pkcs12 format.

## Converting the .crt & .key files to .pem
Use the `generate-pem-files.sh` script for this. The script will grab .crt & .key files from the certs & pvt_keys directories respectively based on the host names supplied in the node-list file.

`generate-pem-files.sh <node list file> <ca cert file name>`

## What goes inside which folder
Here's the use of each folder:

pvt_keys: Private key for each host is saved here using the naming convention, \<Host FQDN Name\>.key. The CA key uses the name ca.key.

csr: The generated certificate signing request files are saved here using the naming convention, \<Host FQDN Name\>.csr

certs: Certificates for each host are saved here with the extension name .crt.

keystore: The keystore file goes here; it uses the naming convention, \<Host FQDN Name\>.pkcs12

truststore: The truststore file goes here; it is named truststore.pkcs12

cfg: For each host that requires a cetificate, input needs to be provided in the ./cfg/\<Host FQDN Name\>.cfg file.

pem-files: The pem files go here.














