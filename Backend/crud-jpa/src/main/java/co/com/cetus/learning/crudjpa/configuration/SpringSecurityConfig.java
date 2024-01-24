package co.com.cetus.learning.crudjpa.configuration;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;

import org.springframework.security.config.Customizer;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;
import org.springframework.security.web.SecurityFilterChain;

import jakarta.servlet.Filter;
import lombok.extern.slf4j.Slf4j;

@EnableWebSecurity
@Configuration
@Slf4j
public class SpringSecurityConfig {

        private UserDetailsService userDetailsService;

        // SpringSecurityConfig(UserDetailsService userDetailsService) {
        // this.userDetailsService = userDetailsService;
        // }

        // @Autowired
        // public void configurerGlobal(AuthenticationManagerBuilder build,
        // BCryptPasswordEncoder passwordEncoder)
        // throws Exception {
        // log.info("Apunto de usar el build");

        // build.userDetailsService(this.userDetailsService).passwordEncoder(passwordEncoder);

        // }

        @Bean
        public InMemoryUserDetailsManager userDetails() {

                List<UserDetails> users = List.of(
                                User
                                                .withUsername("user1")
                                                .password("{noop}user1")
                                                .roles("USER")
                                                .build(),
                                User
                                                .withUsername("user2")
                                                .password("{noop}user2")
                                                .roles("OPERADOR")
                                                .build(),
                                User
                                                .withUsername("admin")
                                                .password("{noop}admin")
                                                .roles("USER", "ADMIN")
                                                .build());

                log.info("Se construtyó");
                return new InMemoryUserDetailsManager(users);
        }

        @Bean
        SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
                log.info("Autorizando");
                http.csrf(cus -> cus.disable())
                                .authorizeHttpRequests(aut -> aut
                                                .requestMatchers(HttpMethod.POST, "/contactos")
                                                .hasRole("ADMIN")
                                                .requestMatchers(HttpMethod.DELETE, "/contactos/**")
                                                .hasAnyRole("ADMIN", "OPERADOR")
                                                .requestMatchers("/contactos").authenticated()
                                                .anyRequest().permitAll())
                                .httpBasic(Customizer.withDefaults());
                SecurityFilterChain filterChain = http.build();
                log.info("-------------------------------------------------------------");
                for (Filter fil : filterChain.getFilters()) {
                        log.info("Filtro " + fil);
                }
                log.info("-------------------------------------------------------------");
                return filterChain;
        }

}
