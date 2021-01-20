#!/bin/bash
#echo "BEGIN running $0.."
server=$1
port=$2
os=$3

if [ $# -lt 3 ];then
	#echo "$0 <server> <port> <os>"
	exit 1;
fi

if [ "$server" == "" ];then
	#echo "$0 server name can't be blank"
	exit 1;
fi

#echo "args: server=$server port=$port os=$os"
os_short=${os:0:3}
os_short=${os_short,,}
#echo $os_short
if [[ $os_short == "win" ]]; then
	nc_cmd_path="./ExternalTools/nc.exe"
else
	nc_cmd_path="nc"	
fi
nc_cmd="$nc_cmd_path -i 4 -w 4 -vvv $server $port"
output="`$nc_cmd 2>&1`"
#echo "$output"
result=""
exit_code=-10
if [[ "$output" =~ .*"CONNECT SUCCESS".* ]] || [[ "$output" =~ .*"succeeded".* ]] ; then
	result="$nc_cmd CONNECTION SUCCESSFUL"
	exit_code=0 
else
	result="$nc_cmd CONNECTION FAILED"
	exit_code=1
fi
echo $result
#echo "END running $"
exit $exit_code

