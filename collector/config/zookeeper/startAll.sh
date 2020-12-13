#!/bin/bash
path=`pwd`

PID=`jps -mvl | grep "org.apache.zookeeper.server.quorum.QuorumPeerMain"  | awk '{print $1}'`

if [ -n "${PID}" ]
then
    for pid in $PID
	{  
		echo "zookeeper process is running, port is $pid"
	}
else
	$path/zk-node1/bin/zkServer.sh start $path/zk-conf/zoo-node1.cfg
	$path/zk-node2/bin/zkServer.sh start $path/zk-conf/zoo-node2.cfg
	$path/zk-node3/bin/zkServer.sh start $path/zk-conf/zoo-node3.cfg

	echo "zkpath is ${path}, start zookeeper success!"
fi
