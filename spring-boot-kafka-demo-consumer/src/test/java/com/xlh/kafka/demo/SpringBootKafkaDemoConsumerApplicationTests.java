package com.xlh.kafka.demo;

import com.xlh.kafka.demo.consumer.KafkaConsumerService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class SpringBootKafkaDemoConsumerApplicationTests {

    @Autowired
    private KafkaConsumerService kafkaProducerService;

    @Test
    public void send() throws InterruptedException {

//        String topic = "topic02";
//        for (int i = 0; i < 1000; i++) {
//            kafkaProducerService.sendMessage(topic, "hello kafka" + i);
//            Thread.sleep(5);
//        }
//
//        Thread.sleep(Integer.MAX_VALUE);

    }

}
