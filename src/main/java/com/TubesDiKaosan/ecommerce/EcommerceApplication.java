package com.TubesDiKaosan.ecommerce;

import org.hibernate.cfg.Configuration;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.stereotype.Component;

@SpringBootApplication(exclude = {SecurityAutoConfiguration.class})
@Component

public class EcommerceApplication extends SpringBootServletInitializer  {
	
	@Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
        return builder.sources(EcommerceApplication.class);
    }
	public static void main(String[] args) {
		Configuration configuration = new Configuration();
        configuration.setProperty("hibernate.hbm2ddl.col_names", "reverse-alphabetical");
		SpringApplication.run(EcommerceApplication.class, args);
	}

}
