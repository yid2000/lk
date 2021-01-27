set server=%1
set port=%2

set	nc_cmd=..\ExternalTools\nc.exe
set nc_cmd=%nc_cmd% -i 4 -w 4 -vvv %server% %port%
set result=
set exitcode=3
set timestamp=%date:~10,4%%date:~4,2%%date:~7,2%_%time:~0,8%
set timestamp=%timestamp::=_%
set outfilename=%server%_%port%_%timestamp%.out
set is_success=false
%nc_cmd% > %outfilename% 2>&1

findstr /c:"CONNECT SUCCESS" %outfilename% > NUL
if %errorlevel% EQU 0 ( set is_success=true)

if "%is_success%"=="true" (
	set result=CONNECTION SUCCESSFUL
	set exitcode=0
) else (
	set result=CONNECTION FAILED
	set exitcode=3
)
echo %result%:exitcode=%exitcode%:%nc_cmd%
exit /b %exitcode%




