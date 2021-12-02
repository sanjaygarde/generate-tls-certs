# Pass node list as $1 & ca cert & key file name

if [ $# -ne 2 ]
  then
	echo "Arguments missing."
	echo "Usage: generate-self-signed-certs.sh <node list file> ca"
	echo "The node list file should contain each node entry(FQDN) on a new line."
        exit 1
fi

# create the cert dirs
mkdir pem-files

declare -a nodes

i=0
while IFS= read -r line; do
	nodes[$i]=$line
	i=$(($i+1))
done < $1

for each in ${nodes[@]};
do
	echo "############ Converting crt & key for "$each" ############"
    # converts server cert & key to pem
    # converts certs/$1.crt to pem-files/$1.pem
    ./subscripts/convert_crt_2_pem.sh $each

    # converts server key to pem
    # converts certs/$1.key to pem-files/$1-key.pem
    ./subscripts/convert_key_2_pem.sh $each
done

# converts ca cert & key to pem
# converts certs/$2.crt to pem-files/$2.pem
echo "############ Converting ca crt to pem ##############"
./subscripts/convert_crt_2_pem.sh $2


