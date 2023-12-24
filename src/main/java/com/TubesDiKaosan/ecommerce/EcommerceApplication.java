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

import com.TubesDiKaosan.ecommerce.models.Payment;
import com.TubesDiKaosan.ecommerce.models.PaymentMethod;
import com.TubesDiKaosan.ecommerce.models.Roles;
import com.TubesDiKaosan.ecommerce.models.Users;
import com.TubesDiKaosan.ecommerce.repositories.PaymentMethodRepository;
import com.TubesDiKaosan.ecommerce.repositories.PaymentRepository;
import com.TubesDiKaosan.ecommerce.repositories.RolesRepository;
import com.TubesDiKaosan.ecommerce.repositories.UserRepository;

@SpringBootApplication(exclude = { SecurityAutoConfiguration.class })
@Component

public class EcommerceApplication extends SpringBootServletInitializer {

	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
		return builder.sources(EcommerceApplication.class);
	}

	public static void main(String[] args) {
		Configuration configuration = new Configuration();
		configuration.setProperty("hibernate.hbm2ddl.col_names", "reverse-alphabetical");
		SpringApplication.run(EcommerceApplication.class, args);
	}

	private static String generateRandomNumber(int length) {
		StringBuilder accountNumber = new StringBuilder();
		for (int i = 0; i < length; i++) {
			accountNumber.append((int) (Math.random() * 10));
		}
		return accountNumber.toString();
	}

	@Bean
	CommandLineRunner init(UserRepository userRepository, RolesRepository rolesRepository,
			PaymentMethodRepository paymentRepository) {
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
			}

			if (paymentRepository.findAll().isEmpty()) {
				List<String> payment = Arrays.asList("Bank Central Asia", "Bank Negara Indonesia",
						"Bank Rakyat Indonesia", "Bank MANDIRI");
				List<String> norek = Arrays.asList(
						generateRandomNumber(10), // BCA
						generateRandomNumber(10), // BNI
						generateRandomNumber(15), // BRI
						generateRandomNumber(13) // Mandiri
				);
				payment.forEach(pay -> {
					PaymentMethod newPayment = new PaymentMethod();
					newPayment.setPayment_method_name(pay);
					if (pay.equals("Bank Central Asia")) {
						newPayment.setNorek(norek.get(0));
					} else if (pay.equals("Bank Negara Indonesia")) {
						newPayment.setNorek(norek.get(1));
					} else if (pay.equals("Bank Rakyat Indonesia")) {
						newPayment.setNorek(norek.get(2));
					} else if (pay.equals("Bank MANDIRI")) {
						newPayment.setNorek(norek.get(3));
					}
					newPayment.setIsActive(1);
					paymentRepository.save(newPayment);
				});
			}
		};
	}
}
