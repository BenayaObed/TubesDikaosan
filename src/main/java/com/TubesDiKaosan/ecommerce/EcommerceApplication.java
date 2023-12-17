package com.TubesDiKaosan.ecommerce;

import java.util.Arrays;
import java.util.List;

import org.hibernate.cfg.Configuration;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Component;

import com.TubesDiKaosan.ecommerce.models.Roles;
import com.TubesDiKaosan.ecommerce.models.Users;
import com.TubesDiKaosan.ecommerce.repositories.RolesRepository;
import com.TubesDiKaosan.ecommerce.repositories.UserRepository;

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

	@Bean
	CommandLineRunner init(UserRepository userRepository,RolesRepository rolesRepository) {
		return args -> {
			List<String> roles = Arrays.asList("CUSTOMER", "ADMIN");
			if (rolesRepository.findAll().isEmpty()) {
				roles.forEach(role -> {
					Roles newRole = new Roles();
					newRole.setRole_name(role);
					rolesRepository.save(newRole);
				});
			}
			if (userRepository.findAll().isEmpty()) {
				Users user = new Users();
				user.setEmail("test@admin.com");
				user.setFirst_name("DiKaosan");
				user.setLast_name("Admin");
				user.setPassword("admin");
				user.setRole(rolesRepository.existsByName("ADMIN"));
				userRepository.save(user);
		}};
	}
}
