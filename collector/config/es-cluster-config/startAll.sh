#!/bin/bash
path=`pwd`

PID=`jps -mvl | grep "org.elasticsearch.bootstrap.Elasticsearch"  | awk '{print $1}'`

if [ -n "${PID}" ]
then
    for pid in $PID
	{  
		echo "es process is running, port is $pid"
	}
else
	$path/es-node1/bin/elasticsearch -d
	$path/es-node2/bin/elasticsearch -d
	$path/es-node3/bin/elasticsearch -d

	echo "espath is ${path}, start es success!"
fi

# /Users/huxiaolei/software/elasticsearch/es7.10.0-cluster/kibana-7.10.0/bin/../node/bin/node /Users/huxiaolei/software/elasticsearch/es7.10.0-cluster/kibana-7.10.0/bin/../src/cli/dist

KIBANA_PID=`ps -ef | grep "$path/kibana-7.10.0/bin/../node/bin/node $path/kibana-7.10.0/bin/../src/cli/dist" | grep -v grep |awk '{print $2}'`

# KIBANA_PID=`ps -ef | grep "$path/bin/../node/bin/node $path/bin/../src/cli/dist"`
# echo $KIBANA_PID
# KIBANA_PID=`ps -ef | grep "/Users/huxiaolei/software/elasticsearch/es7.10.0-cluster/kibana-7.10.0/bin/../node/bin/node /Users/huxiaolei/software/elasticsearch/es7.10.0-cluster/kibana-7.10.0/bin/../src/cli/dist" | grep -v grep |awk '{print $2}'`

if [ -n "${KIBANA_PID}" ]
then
    echo "kibana process is running, port is $KIBANA_PID"
else
	nohup $path/kibana-7.10.0/bin/kibana >> $path/kibana-7.10.0/kibana.log 2>&1 &

	echo "kibanapath is $path/kibana-7.10.0, start kibana success!"
fi