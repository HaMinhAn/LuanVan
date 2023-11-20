package com.luanvan.webservice;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

@SpringBootApplication
@EnableDiscoveryClient

public class WebserviceApplication {
	final static Logger logger = LoggerFactory.getLogger(WebserviceApplication.class);
	public static void main(String[] args) {
		SpringApplication.run(WebserviceApplication.class, args);
	}

}
