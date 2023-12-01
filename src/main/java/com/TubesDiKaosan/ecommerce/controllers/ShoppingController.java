package com.TubesDiKaosan.ecommerce.controllers;

import java.sql.SQLException;
import java.util.List;
import java.util.UUID;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Scope;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.context.WebApplicationContext;

import com.TubesDiKaosan.ecommerce.payloads.response.Response;
import com.TubesDiKaosan.ecommerce.services.ShoppingServiceImplement;
import com.TubesDiKaosan.ecommerce.services.ProductServiceImplement;

@SpringBootApplication
@Controller
@Scope(value = WebApplicationContext.SCOPE_REQUEST)
public class ShoppingController {
    @Autowired
    private ShoppingServiceImplement cartService;
    @Autowired
    private ProductServiceImplement inventoryService;
}
