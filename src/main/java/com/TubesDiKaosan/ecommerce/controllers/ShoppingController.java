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

    @PostMapping("/addTocart")
    public String addToCart(@RequestParam("product_id") Integer product_id, @RequestParam("colors") String color,
            @RequestParam("sizes") String size, HttpSession session)
            throws SQLException {
        if (session.getAttribute("user") != null) {
            Users user = (Users) session.getAttribute("user");
            Orders orders = (Orders) shoppingServices.getDraftOrder(user.getUser_id()).getData();
            if (orders == null) {
                shoppingServices.createDraftOrder(user);
            }
            Orders container_draft = (Orders) shoppingServices.getDraftOrder(user.getUser_id()).getData();
            OrderItemRequest request = new OrderItemRequest(product_id, color, size, 1);
            shoppingServices.addOrderItem(request, container_draft);
            return "redirect:/shoping_cart";
        }
        return "redirect:/";
    }

    // update cart
    @PostMapping("/updateCart")
    public String updateCart(@RequestParam("product_id") Integer product_id, @RequestParam("colors") String color,
            @RequestParam("sizes") String size, @RequestParam("quantity") Integer quantity, HttpSession session)
            throws SQLException {
        if (session.getAttribute("user") != null) {
            Users user = (Users) session.getAttribute("user");
            Orders orders = (Orders) shoppingServices.getDraftOrder(user.getUser_id()).getData();
            if (orders == null) {
                shoppingServices.createDraftOrder(user);
            }
            Orders container_draft = (Orders) shoppingServices.getDraftOrder(user.getUser_id()).getData();
            OrderItemRequest request = new OrderItemRequest(product_id, color, size, quantity);
            // shoppingServices.updateOrderItem(request, container_draft);
            return "redirect:/shoping_cart";
        }
        return "redirect:/";
    }
}
