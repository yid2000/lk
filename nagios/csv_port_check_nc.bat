rem echo BEGIN running %0..
set input_file_path=%1
set output_file_path=%2
echo input_file_path=%input_file_path%  output_file_path=%output_file_path%

echo source_server_name,dest_host,dest_port,result,exit_code>%output_file_path%
for /f "skip=1 usebackq tokens=1-4 delims=," %%i in (%input_file_path%) do (
	CALL CustomPlugins\port_check_nc.bat %%j %%k %%l %%i
	echo %%i,%%j,%%k,%%l,%result%,-1>>%output_file_path%
)

rem echo END running %0
