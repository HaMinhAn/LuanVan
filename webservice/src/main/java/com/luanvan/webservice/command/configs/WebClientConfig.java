package com.luanvan.webservice.command.configs;

import com.luanvan.webservice.command.dto.DecreaseQuantity;
import com.luanvan.webservice.command.dto.SendProductToCart;
import org.apache.kafka.clients.consumer.ConsumerConfig;
import org.apache.kafka.clients.producer.ProducerConfig;
import org.apache.kafka.common.serialization.StringDeserializer;
import org.apache.kafka.common.serialization.StringSerializer;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.cloud.client.loadbalancer.LoadBalanced;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.kafka.config.ConcurrentKafkaListenerContainerFactory;
import org.springframework.kafka.core.ConsumerFactory;
import org.springframework.kafka.core.DefaultKafkaConsumerFactory;
import org.springframework.kafka.core.DefaultKafkaProducerFactory;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.kafka.core.ProducerFactory;
import org.springframework.kafka.support.serializer.JsonDeserializer;
import org.springframework.kafka.support.serializer.JsonSerializer;
import org.springframework.web.reactive.function.client.WebClient;

import java.util.HashMap;
import java.util.Map;

@Configuration
public class WebClientConfig {
  @Value("${spring.kafka.producer.bootstrap-servers}")
  private String kafkaHost;
  @Bean
  public ConsumerFactory<String, DecreaseQuantity> consumerFactoryDecreaseQuantity() {
    Map<String, Object> props = new HashMap<>();
    props.put(
            ConsumerConfig.BOOTSTRAP_SERVERS_CONFIG,
            kafkaHost);
    props.put(
            ConsumerConfig.GROUP_ID_CONFIG,
            "reduce-quantity");
    props.put(
            ConsumerConfig.KEY_DESERIALIZER_CLASS_CONFIG,
            StringDeserializer.class);
    props.put(
            ConsumerConfig.VALUE_DESERIALIZER_CLASS_CONFIG, JsonDeserializer.class);
    props.put(JsonDeserializer.TYPE_MAPPINGS, "DecreaseQuantity:com.luanvan.webservice.command.dto.DecreaseQuantity");
    return new DefaultKafkaConsumerFactory<>(props);
  }

  @Bean
  @LoadBalanced
  public ConcurrentKafkaListenerContainerFactory<String, DecreaseQuantity> consumerDecreaseQuantity() {
    ConcurrentKafkaListenerContainerFactory<String, DecreaseQuantity> factory =
            new ConcurrentKafkaListenerContainerFactory<>();
    factory.setConsumerFactory(consumerFactoryDecreaseQuantity());
    return factory;
  }
  @Bean
  @LoadBalanced
  public WebClient webClient() {
    return WebClient.builder().build();
  }
}
