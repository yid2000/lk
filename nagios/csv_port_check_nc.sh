file_path=$1
echo "file_path=$file_path"

is_first_line=true
is_blank_line=false
while read l; do 
	if [[ "$is_first_line" == "true" ]]; then
		echo "skipping first line (column names): $l"
		unset is_first_line
	else
		IFS=, read server_name ext_host ext_port <<< $l			
		server_name=$server_name
		echo $server_name
	fi		
done < $file_path

