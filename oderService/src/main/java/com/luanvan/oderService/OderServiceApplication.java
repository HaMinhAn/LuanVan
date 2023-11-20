package com.luanvan.oderService;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;


@SpringBootApplication
public class OderServiceApplication {
	final static Logger logger = LoggerFactory.getLogger(OderServiceApplication.class);
	public static void main(String[] args) {
		SpringApplication.run(OderServiceApplication.class, args);
	}

}
