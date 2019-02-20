package com.examples.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/web")
public class WebController {

    @GetMapping("/")
    public String hello() {
        return "Hello World";
    }

    @GetMapping("/secured")
    public String getSecured() {
        return "Hello Secured World";
    }

}
