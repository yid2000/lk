#!/bin/bash
server=$1
port=$2
echo "args: server=$server port=$port"
nc_cmd="nc -i 4 -w 4 -vvv $server $port"
output="BEGIN: Executing command \"$nc_cmd\"
`$nc_cmd 2>&1`
END"
echo "$output"

if [[ "$output" =~ .*"CONNECT SUCCESS".* ]] || [[ "$output" =~ .*"succeeded".* ]] ; then
	echo "CONNECTION SUCCESSFUL"
	exit 0
else
	echo "CONNECTION FAILED"
	exit 1
fi


