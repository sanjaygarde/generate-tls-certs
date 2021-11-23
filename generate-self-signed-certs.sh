# Pass node list as $1 & keystore password as $2

if [ $# -ne 3 ]
  then
	echo "Arguments missing."
	echo "Usage: generate-self-signed-certs.sh <node list file> <keystore password> <truststore password>"
	echo "The node list file should contain each node entry(FQDN) on a new line."
        exit 1
fi

# delete cert dir
rm -rf certs

# create the cert dir
mkdir certs

# populate nodes from the node list file in $1
declare -a nodes
i=0
while IFS= read -r line; do
	nodes[$i]=$line
	i=$(($i+1))
done < $1

# Generate CA cert & key
./subscripts/generate-ca-cert-and-key.sh

# Generate CA chain
./subscripts/generate-ca-chain.sh

# Generate CSR And Self Sign
for each in ${nodes[@]};
do
	# Generate CSR
	echo "############ Generating csr & key for "$each" ############"
	./subscripts/generate-csr-and-key.sh $each

	# Self Sign
	echo "############ Self signing the certificate for "$each" ############"
	./subscripts/sign-server-cert.sh $each

	# Generate PKCS12 file
	echo "############ Generating keystore/pkcs12 file for "$each" ############"
	./subscripts/generate-keystore.sh $each $2
done

# Generate truststore
./subscripts/generate-truststore.sh $3

