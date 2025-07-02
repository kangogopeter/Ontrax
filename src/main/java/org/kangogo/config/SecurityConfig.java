package org.kangogo.config;


import org.kangogo.service.UserService;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;
import java.io.IOException;

@Configuration
@EnableWebSecurity
public class SecurityConfig {

    @Bean
    public UserDetailsService userDetailsService(UserService userService) {
        return username -> userService.findByUsername(username)
                .map(user -> new org.springframework.security.core.userdetails.User(
                        user.getUsername(),
                        user.getPassword(),
                        java.util.Collections.singletonList(
                                new org.springframework.security.core.authority.SimpleGrantedAuthority(user.getRole())
                        )
                ))
                .orElseThrow(() -> new UsernameNotFoundException("User not found"));
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public AuthenticationFailureHandler authenticationFailureHandler() {
        return new SimpleUrlAuthenticationFailureHandler() {
            @Override
            public void onAuthenticationFailure(jakarta.servlet.http.HttpServletRequest request,
                                                jakarta.servlet.http.HttpServletResponse response,
                                                org.springframework.security.core.AuthenticationException exception)
                    throws IOException, jakarta.servlet.ServletException {
                request.getSession().setAttribute("error", true);
                super.onAuthenticationFailure(request, response, exception);
            }
        };
    }

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http, AuthenticationFailureHandler failureHandler) throws Exception {
        http
                .authorizeHttpRequests((requests) -> requests
                        .requestMatchers("/register", "/login", "/css/**", "/webjars/**", "/custom-servlet").permitAll()
                        .anyRequest().authenticated()
                )
                .formLogin((form) -> form
                        .loginPage("/login")
                        .failureHandler(failureHandler)
                        .permitAll()
                )
                .logout((logout) -> logout
                        .permitAll()
                );
        return http.build();
    }
}