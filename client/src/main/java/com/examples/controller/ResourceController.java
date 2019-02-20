package com.examples.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/admin")
public class ResourceController {

    @GetMapping("/")
    public String hello() {
        return "Hello Admin";
    }

    @GetMapping("/secured")
    public String getAdminSecured() {
        return "Hello Secured Admin";
    }

}
