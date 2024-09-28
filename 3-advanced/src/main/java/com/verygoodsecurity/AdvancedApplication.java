package com.verygoodsecurity;


import lombok.Data;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;

@Slf4j
@EnableScheduling
@SpringBootApplication
public class AdvancedApplication {

    public static void main(String[] args) {
        SpringApplication.run(AdvancedApplication.class, args);
    }

}

@Slf4j
@Data
@Configuration
@ConfigurationProperties(prefix = "service.datasource")
class ReloadingConfiguration {
    public String username;
    public String password;

    @Scheduled(fixedRate = 3_000)
    public void refresh() {
        log.info("Username is [{}]", username);
        log.info("Password is [{}]", password);
    }

}
