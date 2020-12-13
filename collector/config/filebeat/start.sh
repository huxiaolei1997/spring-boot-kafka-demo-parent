#!/bin/bash
filebeatpath=`pwd`

FILEBEAT_PID=`ps -ef | grep "$filebeatpath/filebeat" | grep -v grep |awk '{print $2}'`

if [ -n "${FILEBEAT_PID}" ]
then
    echo "filebeat process is running, port is $FILEBEAT_PID"
else
	nohup $filebeatpath/filebeat > $filebeatpath/filebeat.out 2>&1 &

	echo "filebeatpath is $filebeatpath, start filebeat success!"
fi