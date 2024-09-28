package com.verygoodsecurity;


import jakarta.annotation.PostConstruct;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Configuration;

@Slf4j
@SpringBootApplication
public class ParamStoreApplication {

    public static void main(String[] args) {
        SpringApplication.run(ParamStoreApplication.class, args);
    }

}

@Slf4j
@Configuration
class UserCredentials {

    @Autowired
    private ApplicationContext context;
    @Value("${service.datasource.username}")
    public String username;
    @Value("${service.datasource.password}")
    public String password;

    @PostConstruct
    public void init() {
        log.info("Username is [{}]", username);
        log.info("Password is [{}]", password);

        System.exit(SpringApplication.exit(context, () -> 1));
    }

}



