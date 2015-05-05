#!/bin/bash

######################################################
# name: auto-connect
# version: 0.1
# authors: Cristian Sottile
# colaborators: Bruno Cascio, Cirano Eusebi
######################################################


function connect {
	for i in 1 2 3; do
		curl -X POST https://1.1.1.1/login.html -d $args -k --ssl -$i &>/dev/null
		if [ $? -eq 0 ]; then
			success=0
			return
		fi
	done

	success=1
	return
}

args="buttonClicked=4&err_flag=0&err_msg=0&info_flag=0&info_msg=0&redirect_url=http://&username=internet&password=internet"
while true; do
	curl -I http://info.unlp.edu.ar &>/dev/null
	if [ $? -ne 0 ]; then
		connect
		if [ $success -eq 1 ]; then
			echo "Error 2: connection attemp failed. Will try again in 1 minute."
		fi
	fi
	sleep 20s
done
