#!/bin/bash
echo "BEGIN running $0.."
input_file_path=$1
output_file_path=$2
echo "input_file_path=$input_file_path  output_file_path=$output_file_path"

is_first_line=true
is_blank_line=false
echo "source_server_name,dest_host,dest_port,result,exit_code" > $output_file_path
while IFS=, read -r source_server_names dest_host dest_port source_os
do
	if [[ "$is_first_line" == "true" ]]; then
		#echo "Skipping header row.."
		unset is_first_line
	else
		#echo "Processing servers:$source_server_names .."
		if [[ -z "$dest_host" ]]; then
			#echo "Skipping blank row"
			continue
		else
			IFS=';' read -r -a array <<< "$source_server_names"
			for source_server_name in "${array[@]}"
				do
					#echo "$source_server_name $dest_host $dest_port"
					result=$(./CustomPlugins/port_check_nc.sh $dest_host $dest_port $source_os $output_file_path </dev/null)
					echo "$source_server_name,$dest_host,$dest_port,$result,$?" >> $output_file_path
				done
		fi
	fi		
done < $input_file_path

echo "END running $0"
