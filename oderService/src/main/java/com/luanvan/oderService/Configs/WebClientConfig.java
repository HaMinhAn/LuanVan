package com.luanvan.oderService.Configs;

import com.luanvan.oderService.dto.DecreaseQuantity;
import com.luanvan.oderService.dto.MailOrder;
import com.luanvan.oderService.dto.MailStatus;
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

import java.util.HashMap;
import java.util.Map;

@Configuration
public class WebClientConfig {
  @Value("${spring.kafka.producer.bootstrap-servers}")
  private String kafkaHost;
  @Bean
  public ProducerFactory<String, MailOrder> producerFactoryToMail() {
    Map<String, Object> configProps = new HashMap<>();
    configProps.put(
            ProducerConfig.BOOTSTRAP_SERVERS_CONFIG,
            kafkaHost);
    configProps.put(
            ProducerConfig.KEY_SERIALIZER_CLASS_CONFIG,
            StringSerializer.class);
    configProps.put(
            ProducerConfig.VALUE_SERIALIZER_CLASS_CONFIG, JsonSerializer.class);
    configProps.put(JsonSerializer.TYPE_MAPPINGS, "MailOrder:com.luanvan.oderService.dto.MailOrder");
    return new DefaultKafkaProducerFactory<>(configProps);
  }

  @Bean
  public ProducerFactory<String, MailStatus> producerFactoryToMailStatus() {
    Map<String, Object> configProps = new HashMap<>();
    configProps.put(
            ProducerConfig.BOOTSTRAP_SERVERS_CONFIG,
            kafkaHost);
    configProps.put(
            ProducerConfig.KEY_SERIALIZER_CLASS_CONFIG,
            StringSerializer.class);
    configProps.put(
            ProducerConfig.VALUE_SERIALIZER_CLASS_CONFIG, JsonSerializer.class);
    configProps.put(JsonSerializer.TYPE_MAPPINGS, "MailOrder:com.luanvan.oderService.dto.MailStatus");
    return new DefaultKafkaProducerFactory<>(configProps);
  }
  @Bean
  public ProducerFactory<String, DecreaseQuantity> producerFactoryToBook() {
    Map<String, Object> configProps = new HashMap<>();
    configProps.put(
            ProducerConfig.BOOTSTRAP_SERVERS_CONFIG,
            kafkaHost);
    configProps.put(
            ProducerConfig.KEY_SERIALIZER_CLASS_CONFIG,
            StringSerializer.class);
    configProps.put(
            ProducerConfig.VALUE_SERIALIZER_CLASS_CONFIG, JsonSerializer.class);
    configProps.put(JsonSerializer.TYPE_MAPPINGS, "DecreaseQuantity:com.luanvan.oderService.dto.DecreaseQuantity");
    return new DefaultKafkaProducerFactory<>(configProps);
  }
  @Bean
  public ProducerFactory<String, String> producerFactory() {
    Map<String, Object> configProps = new HashMap<>();
    configProps.put(
            ProducerConfig.BOOTSTRAP_SERVERS_CONFIG,
            kafkaHost);
    configProps.put(
            ProducerConfig.KEY_SERIALIZER_CLASS_CONFIG,
            StringSerializer.class);
    configProps.put(
            ProducerConfig.VALUE_SERIALIZER_CLASS_CONFIG,
            StringSerializer.class);
    return new DefaultKafkaProducerFactory<>(configProps);
  }

  @Bean
  @LoadBalanced
  public KafkaTemplate<String, MailOrder> kafkaTemplate2() {
    return new KafkaTemplate<>(producerFactoryToMail());
  }
  @Bean
  @LoadBalanced
  public KafkaTemplate<String, String> kafkaTemplate() {
    return new KafkaTemplate<>(producerFactory());
  }

  @Bean
  @LoadBalanced
  public KafkaTemplate<String, MailStatus> kafkaTemplate3() {
    return new KafkaTemplate<>(producerFactoryToMailStatus());
  }

  @Bean
  @LoadBalanced
  public KafkaTemplate<String, DecreaseQuantity> kafkaTemplate4() {
    return new KafkaTemplate<>(producerFactoryToBook());
  }
}
