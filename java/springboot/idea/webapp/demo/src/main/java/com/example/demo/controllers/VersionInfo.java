package com.example.demo.controllers;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class VersionInfo {
    @GetMapping("/ver")
    public String getVersion() {
        return "0.1";
    }
}
