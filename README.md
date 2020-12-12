# Kafka Demo

## 安装Kafka

Kafka（[下载地址](http://kafka.apache.org/downloads.html
)）依赖JDK和Zookeeper，首先需要安装jdk和zk。

#### 解压命令： 
> tar -zxvf kafka_2.12-2.1.0.tgz -C /usr/local/ 

#### 改名命令： 
> mv kafka_2.12-2.1.0/ kafka_2.12 

#### 进入解压后的目录，修改server.properties文件： 
> vim /usr/local/kafka_2.12/config/server.properties 

#### 修改配置： 
```text
broker.id=0 
port=9092 
host.name=192.168.11.51 
advertised.host.name=192.168.11.51 
log.dirs=/usr/local/kafka_2.12/kafka-logs 
num.partitions=2 
zookeeper.connect=192.168.11.111:2181,192.168.11.112:2181,192.168.11.113:2181 
```

#### 建立日志文件夹： 
> mkdir /usr/local/kafka_2.12/kafka-logs 

#### 启动kafka： 
> /usr/local/kafka_2.12/bin/kafka-server-start.sh /usr/local/kafka_2.12/config/server.properties &

## 简单操作： 
### 创建topic主题命令：（创建名为test的topic， 1个分区分别存放数据，数据备份总共1份）
> kafka-topics.sh --zookeeper 127.0.0.1:2181 --create --topic topic1 --partitions 1 --replication-factor 1

```text
--zookeeper 为zk服务列表 
--create 命令后 --topic 为创建topic 并指定 topic name 
--partitions 为指定分区数量 
--replication-factor 为指定副本集数量 
```

### 查看topic列表命令： 
> kafka-topics.sh --zookeeper 127.0.0.1:2181 --list 

### kafka命令发送数据：（然后我们就可以编写数据发送出去了） 
> kafka-console-producer.sh --broker-list 127.0.0.1:9092 --topic topic1 

### kafka命令接受数据：（然后我们就可以看到消费的信息了） 
> kafka-console-consumer.sh --bootstrap-server 127.0.0.1:9092 --topic topic1 --from-beginning 

### 删除topic命令： 
> kafka-topics.sh --zookeeper 127.0.0.1:2181 --delete --topic topic1 

#（6）kafka查看消费进度：（当我们需要查看一个消费者组的消费进度时，则使用下面的命令）
> kafka-consumer-groups.sh --bootstrap-server 127.0.0.1:9092 --descirbe --group group1
