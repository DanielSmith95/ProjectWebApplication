package org.mmu.daniel.FlashSalePlatformWebService;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication
@EnableJpaRepositories
public class FlashSalePlatformWebServiceApplication {

	public static void main(String[] args) {
		SpringApplication.run(FlashSalePlatformWebServiceApplication.class, args);
	}
}
