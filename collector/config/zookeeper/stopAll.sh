#!/bin/bash

path=`pwd`

# 停止zookeeper进程
PID=`jps -mvl | grep "org.apache.zookeeper.server.quorum.QuorumPeerMain"  | awk '{print $1}'`

if [ -n "${PID}" ]
then
    for pid in $PID
	{  
		kill $pid
		echo "kill zookeeper process success, port is $pid"
	}
else
	echo "zookeeper process is not running, please check in"	
fi
