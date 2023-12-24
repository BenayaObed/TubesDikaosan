package com.TubesDiKaosan.ecommerce.controllers;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
    public String updateCart(@RequestParam("order_item_id") List<Integer> order_item_id,
            @RequestParam("quantity") List<Integer> quantity, @RequestParam("product_id") List<Integer> product_id) {
        List<OrderItemRequest> cart = new ArrayList<>();
        for (int i = 0; i < order_item_id.size(); i++) {
            OrderItemRequest request = new OrderItemRequest();
            request.setQuantity(quantity.get(i));
            request.setProduct_id(product_id.get(i));
            cart.add(request);
        }

        for (OrderItemRequest orderItemRequest : cart) {
            System.out.println(orderItemRequest.getProduct_id() + " " + orderItemRequest.getQuantity());
        }
        return "redirect:/shoping_cart";
    }
}
