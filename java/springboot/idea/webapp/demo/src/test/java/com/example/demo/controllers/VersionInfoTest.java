package com.example.demo.controllers;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.test.context.junit.jupiter.SpringExtension;

@ExtendWith(SpringExtension.class)
public class VersionInfoTest {
    @Test
    public void success_when_verinfo_is_02() throws Exception {
        VersionInfo info = new VersionInfo();
        String result = info.getVersion();
        Assertions.assertEquals("0.2", result);
    }
}