#!/bin/bash

path="/Users/huxiaolei/software/kafka/kafka_2.12"

# 停止kafka进程
PID=`jps -mvl | grep "kafka.Kafka"  | awk '{print $1}'`

if [ -n "${PID}" ]
then
	# kill $pid
	$path/bin/kafka-server-stop.sh
	echo "kill kafka process success, port is $PID"
else
	echo "kafka process is not running, please check in"	
fi