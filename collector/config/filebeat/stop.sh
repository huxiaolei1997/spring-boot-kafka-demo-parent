#!/bin/bash

filebeatpath=`pwd`


FILEBEAT_PID=`ps -ef | grep "$filebeatpath/filebeat" | grep -v grep |awk '{print $2}'`

if [ -n "${FILEBEAT_PID}" ]
then
	kill $FILEBEAT_PID
    echo "kill filebeat process success, port is $FILEBEAT_PID"
else
	echo "filebeat is not running, please check in!"
fi