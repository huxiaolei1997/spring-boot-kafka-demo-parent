#!/bin/bash

# 停止logstash进程
PID=`jps -mvl | grep "org.logstash.Logstash"  | awk '{print $1}'`

if [ -n "${PID}" ]
then
    for pid in $PID
	{  
		kill $pid
		echo "kill logstash process $pid success!"
	}
else
	echo "logstash process is not running, please check in"	
fi