package com.TubesDiKaosan.ecommerce.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.web.servlet.WebMvcAutoConfiguration;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.servlet.util.matcher.MvcRequestMatcher;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;
import org.springframework.web.servlet.handler.HandlerMappingIntrospector;

import com.TubesDiKaosan.ecommerce.services.UsersService;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebMvcAutoConfiguration {

        private UsersService userService;

        @Autowired
        public void setUserService(UsersService userService) {
                this.userService = userService;
        }

        @Bean
        public BCryptPasswordEncoder passwordEncoder() {
                return new BCryptPasswordEncoder();
        }

        @Autowired
        public DaoAuthenticationProvider authenticationProvider() {
                DaoAuthenticationProvider authProvider = new DaoAuthenticationProvider();

                authProvider.setUserDetailsService((UserDetailsService) userService);
                authProvider.setPasswordEncoder(passwordEncoder());

                return authProvider;
        }

        @Autowired
        public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
                auth.authenticationProvider(authenticationProvider());
        }

        @Bean
        MvcRequestMatcher.Builder mvc(HandlerMappingIntrospector introspector) {
                return new MvcRequestMatcher.Builder(introspector);
        }

        @Bean
        public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
                return http
                                // Ignore CSRF checks for all requests
                                .csrf().disable()
                                .authorizeHttpRequests(requests -> requests
                                                .requestMatchers(AntPathRequestMatcher.antMatcher(HttpMethod.GET,"/")).permitAll()
                                                .requestMatchers(AntPathRequestMatcher.antMatcher("/login")).permitAll()
                                                .requestMatchers(AntPathRequestMatcher.antMatcher("/dashboard/**")).hasAuthority("ADMIN")
                                                .anyRequest().permitAll())
                                .formLogin(form -> form
                                                .loginPage("/login")
                                                .defaultSuccessUrl("/")
                                                .successHandler((request, response, authentication) -> response
                                                                .sendRedirect("/")))
                                .logout(logout -> logout
                                                .logoutUrl("/logout")
                                                .permitAll())
                                .build();
        }
}
