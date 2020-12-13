#!/bin/bash
logstashpath=`pwd`/logstash-7.10.0


PID=`jps -mvl | grep "org.logstash.Logstash"  | awk '{print $1}'`

if [ -n "${PID}" ]
then
    for pid in $PID
	{  
		echo "logstash process is running, port is $pid"
	}
else
	nohup $logstashpath/bin/logstash -f $logstashpath/sync/logstash-kafka-sync.conf > $logstashpath/logstash.out 2>&1 &

	echo "logstashpath is $logstashpath, start success!"
fi