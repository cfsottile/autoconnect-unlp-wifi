@echo off
REM Setting the arguments of the query
SET args="buttonClicked=4&err_flag=0&err_msg=0&info_flag=0&info_msg=0&redirect_url=http://&username=internet&password=internet"
REM this is an infinite loop
set status ="a"
FOR /L %%i IN (1 0 2) DO (
	REM Check if google responds 200 OK
	curl -I https://www.google.com.ar -s
	if ERRORLEVEL 1 (
		FOR /L %%j IN (1 1 3) DO (
			REM send the request to the server so we get internet :)
			curl -X POST https://1.1.1.1/login.html -d %args% -k --ssl -%%j
		)
	)
	REM wait 60 secs and try again
	TIMEOUT /T 60 /NOBREAK
)
