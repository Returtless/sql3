package com.example.sql3;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;


@RestController
public class SQLController {

    @Autowired
    SQLRepository repository;

    @GetMapping("/products/fetch-product")
    public String getFetchProduct(@RequestParam("name") String name) {
        return repository.getProductName(name);
    }
}
