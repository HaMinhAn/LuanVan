package com.luanvan.webservice.command.configs;

import com.luanvan.webservice.command.dto.SendProductToCart;
import org.apache.kafka.clients.producer.ProducerConfig;
import org.apache.kafka.common.serialization.StringSerializer;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.cloud.client.loadbalancer.LoadBalanced;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.kafka.core.DefaultKafkaProducerFactory;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.kafka.core.ProducerFactory;
import org.springframework.kafka.support.serializer.JsonSerializer;
import org.springframework.web.reactive.function.client.WebClient;

import java.util.HashMap;
import java.util.Map;

@Configuration
public class WebClientConfig {
  @Value("${spring.kafka.producer.bootstrap-servers}")
  private String kafkaHost;
  @Bean
  public ProducerFactory<String, SendProductToCart> producerFactory() {
    Map<String, Object> configProps = new HashMap<>();
    configProps.put(
            ProducerConfig.BOOTSTRAP_SERVERS_CONFIG,
            kafkaHost);
    configProps.put(
            ProducerConfig.KEY_SERIALIZER_CLASS_CONFIG,
            StringSerializer.class);
    configProps.put(
            ProducerConfig.VALUE_SERIALIZER_CLASS_CONFIG,
            JsonSerializer.class);
    return new DefaultKafkaProducerFactory<>(configProps);
  }

  @Bean
  @LoadBalanced
  public KafkaTemplate<String, SendProductToCart> kafkaTemplate() {
    return new KafkaTemplate<>(producerFactory());
  }
  @Bean
  @LoadBalanced
  public WebClient webClient() {
    return WebClient.builder().build();
  }
}
