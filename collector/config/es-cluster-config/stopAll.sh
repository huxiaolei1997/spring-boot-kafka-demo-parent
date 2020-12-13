#!/bin/bash

path=`pwd`

# 停止es进程
PID=`jps -mvl | grep "org.elasticsearch.bootstrap.Elasticsearch"  | awk '{print $1}'`

if [ -n "${PID}" ]
then
    for pid in $PID
	{  
		kill $pid
		echo "kill es process success, port is $pid"
	}
else
	echo "es process is not running, please check in"	
fi

KIBANA_PID=`ps -ef | grep "$path/kibana-7.10.0/bin/../node/bin/node $path/kibana-7.10.0/bin/../src/cli/dist" | grep -v grep |awk '{print $2}'`

if [ -n "${KIBANA_PID}" ]
then
	kill $KIBANA_PID
    echo "kill kibana process success, port is $KIBANA_PID"
else
	echo "kibana is not running, please check in!"
fi

# arr=($PID)
# for loop in arr
# do
#     echo "The value is: $loop"
# done
# kill pids
# echo '$pids 已经'