package com.TubesDiKaosan.ecommerce.controllers;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.TubesDiKaosan.ecommerce.models.CustomerAddress;
import com.TubesDiKaosan.ecommerce.models.Orders;
import com.TubesDiKaosan.ecommerce.models.Users;
import com.TubesDiKaosan.ecommerce.payloads.requests.OrderItemRequest;
import com.TubesDiKaosan.ecommerce.payloads.response.Response;
import com.TubesDiKaosan.ecommerce.repositories.UserRepository;
import com.TubesDiKaosan.ecommerce.services.ShoppingServices.ShoppingServices;

import ch.qos.logback.core.model.Model;
import jakarta.servlet.http.HttpSession;

@Controller
public class ShoppingController {

    @Autowired
    private ShoppingServices shoppingServices;

    @Autowired
    private UserRepository userRepository;

    // @RequestMapping("/api/cart")
    // // 037208b9-0f92-4eaa-8fed-e10b7e9afbd8
    // public ResponseEntity<?> cart(Model model, HttpSession session) throws SQLException {
    //     Response orders = shoppingServices.getAllOrdersByCustomer("17bacaa6-5a9a-45ef-92e6-0353bbd2844a"); // bundle
    //     Response ordersItem = shoppingServices.getAllOrdersItem(1,"17bacaa6-5a9a-45ef-92e6-0353bbd2844a"); // bundle order id
    //     return ResponseEntity.ok(ordersItem);
    // }

    @PostMapping("/api/addToCart")
    public ResponseEntity<?> addToCart(@RequestBody OrderItemRequest request ,HttpSession session) throws SQLException {
        Users user = userRepository.findById("33ba7717-1765-487e-b675-6068fda0d592").get();
        // Users user = userRepository.findById(user_id).get();
        // Orders orders = (Orders) shoppingServices.getDraftOrder(user.getUser_id()).getData();
        Orders orders = (Orders) shoppingServices.getDraftOrder(user.getUser_id()).getData();
        if (orders == null) { 
            shoppingServices.createDraftOrder(user);
        }
        Orders container_draft = (Orders) shoppingServices.getDraftOrder(user.getUser_id()).getData();
        shoppingServices.addOrderItem(request,container_draft);

        return ResponseEntity.ok(orders);
    }
}
