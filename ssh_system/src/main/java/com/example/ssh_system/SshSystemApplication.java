package com.example.ssh_system;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;


//@EnableAutoConfiguration
@SpringBootApplication
@MapperScan("com.example.ssh_system.mapper")
public class SshSystemApplication {

    public static void main(String[] args) {
        SpringApplication.run(SshSystemApplication.class, args);
    }

}
