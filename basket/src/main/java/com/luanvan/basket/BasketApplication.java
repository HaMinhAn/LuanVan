package com.luanvan.basket;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

@SpringBootApplication
@EnableDiscoveryClient
public class BasketApplication {
	final static Logger logger = LoggerFactory.getLogger(BasketApplication.class);
	public static void main(String[] args) {
		SpringApplication.run(BasketApplication.class, args);
	}

}
