package com.example.demo.controllers;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value="/api", produces = "application/json")
public class VersionInfo {
    @GetMapping("/ver")
    public String getVersion() {
        return "0.2";
    }
}
