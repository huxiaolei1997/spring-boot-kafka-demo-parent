#!/bin/bash
path=`pwd`

# 先启动zk集群
cd /Users/huxiaolei/software/zookeeper/zk-cluster-3.5.6
bash startAll.sh

cd $path

PID=`jps -mvl | grep "kafka.Kafka"  | awk '{print $1}'`

if [ -n "${PID}" ]
then
    for pid in $PID
	{  
		echo "kafka process is running, port is $pid"
	}
else
	nohup $path/bin/kafka-server-start.sh $path/config/server.properties > kafka.log 2>&1 &

	echo "kafkapath is ${path}, start kafka success!"
fi