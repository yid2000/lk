set server=%1
set port=%2
set os=%3
set source_server=%4

set	nc_cmd_path=
if /i "%os:~0,3%"=="win" set nc_cmd_path=ExternalTools\nc.exe
if /i "%os:~0,3%" neq "win" set nc_cmd_path=nc

set nc_cmd=%nc_cmd_path% -i 4 -w 4 -vvv %server% %port%
set out_file_name=%source_server%_%server%_%port%.txt
%nc_cmd% 2>&1>%out_file_name%
exit /b 0




