package com.email.luanvan;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class EmailServiceApplication {
	final static Logger logger = LoggerFactory.getLogger(EmailServiceApplication.class);
	public static void main(String[] args) {
		SpringApplication.run(EmailServiceApplication.class, args);
	}

}
