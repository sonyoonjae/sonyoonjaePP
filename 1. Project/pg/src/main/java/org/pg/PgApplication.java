package org.pg;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableAsync;

@SpringBootApplication
@EnableAsync
public class PgApplication {

	public static void main(String[] args) {
		SpringApplication.run(PgApplication.class, args);
	}

}
