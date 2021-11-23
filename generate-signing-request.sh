# Pass node list as $1

if [ $# -eq 0 ]
  then
	echo "No arguments supplied."
	echo "Usage: generate-signing-request.sh <node list file>"
	echo "The node list file should contain each node entry(FQDN) on a new line."
        exit 1
fi

# delete cert dirs
rm -rf certs

# create the cert dirs
mkdir certs

declare -a nodes

i=0
while IFS= read -r line; do
	nodes[$i]=$line
	i=$(($i+1))
done < $1

for each in ${nodes[@]};
do
	echo "############ Generating csr & key for "$each" ############"
	./subscripts/generate-csr-and-key.sh $each
done
