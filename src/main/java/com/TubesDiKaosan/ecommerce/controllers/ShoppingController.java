package com.TubesDiKaosan.ecommerce.controllers;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.TubesDiKaosan.ecommerce.models.CustomerAddress;
import com.TubesDiKaosan.ecommerce.models.Orders;
import com.TubesDiKaosan.ecommerce.models.OrdersItem;
import com.TubesDiKaosan.ecommerce.models.Product;
import com.TubesDiKaosan.ecommerce.models.Users;
import com.TubesDiKaosan.ecommerce.payloads.requests.CustomerAddressRequest;
import com.TubesDiKaosan.ecommerce.payloads.requests.OrderItemRequest;
import com.TubesDiKaosan.ecommerce.payloads.response.Response;
import com.TubesDiKaosan.ecommerce.repositories.UserRepository;
import com.TubesDiKaosan.ecommerce.services.ActorServices.CustomerService;
import com.TubesDiKaosan.ecommerce.services.ActorServices.UsersService;
import com.TubesDiKaosan.ecommerce.services.PaymentServices.PaymentMethodService;
import com.TubesDiKaosan.ecommerce.services.ProductServices.ProductService;
import com.TubesDiKaosan.ecommerce.services.ShoppingServices.ShoppingServices;

import ch.qos.logback.core.model.Model;
import jakarta.servlet.http.HttpSession;

@Controller
public class ShoppingController {

    @Autowired
    private ShoppingServices shoppingServices;

    @Autowired
    private ProductService ProductService;

    // ORDERS & CARTS
    @Autowired
    private ShoppingServices shoppingService;

    public Response getDraftOrder(String id) throws SQLException { // GET DRAFT ORDER (KERANJANG)
        if (shoppingService.getDraftOrder(id) == null)
            return new Response(HttpStatus.NOT_FOUND.value(), "NO Data!", null);
        else {
            Orders data = (Orders) shoppingService.getDraftOrder(id).getData();
            return new Response(HttpStatus.OK.value(), "success", data);
        }
    }

    public Response getDataCart(Integer orderID, String UserID) throws SQLException { // GET ALL ITEM IN CART
        if (shoppingService.getDataCart(orderID, UserID).getData() == null)
            return new Response(HttpStatus.NOT_FOUND.value(), "NO Data!", null);
        else {
            List<OrdersItem> data = (List<OrdersItem>) shoppingService.getDataCart(orderID, UserID).getData();
            return new Response(HttpStatus.OK.value(), "success", data);
        }
    }

    @PostMapping("/addTocart")
    public String addToCart(@RequestParam("product_id") Integer product_id, @RequestParam("colors") String color,
            @RequestParam("sizes") String size, HttpSession session)
            throws SQLException {
        if (session.getAttribute("user") != null) {
            Users user = (Users) session.getAttribute("user");
            Orders container_draft = (Orders) shoppingServices.getOrderByStatusAndUserID("checkout", user.getUser_id())
                    .getData();
            if (container_draft == null) {
                shoppingServices.createDraftOrder(user);
                container_draft = (Orders) shoppingServices.getDraftOrder(user.getUser_id()).getData();
            }
            Product product = (Product) ProductService.findDataByID(product_id).getData();
            OrderItemRequest request = new OrderItemRequest(product_id, color, size, 1,
                    (float) (product.getPrice() * 1));
            shoppingServices.addOrderItem(request, container_draft);

            // check container draft
            if (container_draft != null) {
                return "redirect:/shoping_cart";
            }
            return "redirect:/shoping_cart";
        }
        return "redirect:/";
    }

    // update cart
    @PostMapping("/updateCart")
    public String updateCart(@RequestParam("order_item_id") List<Integer> order_item_id,
            @RequestParam("quantity") List<Integer> quantity, @RequestParam("product_id") List<Integer> product_id)
            throws SQLException {
        List<OrderItemRequest> cart = new ArrayList<>();
        for (int i = 0; i < order_item_id.size(); i++) {
            OrderItemRequest request = new OrderItemRequest();
            Product product = (Product) ProductService.findDataByID(product_id.get(i)).getData();
            request.setQuantity(quantity.get(i));
            request.setProduct_id(product_id.get(i));
            request.setTotal_price((float) (product.getPrice() * quantity.get(i)));
            cart.add(request);
            shoppingServices.updateOrderItem(order_item_id.get(i), request);
        }
        return "redirect:/shoping_cart";
    }

    @PostMapping("/setBillingAddress")
    public String setBillingAddress(CustomerAddressRequest request, @RequestParam("orders_id") Integer orders_id,
            HttpSession session)
            throws SQLException {
        if (session.getAttribute("user") != null) {
            Users user = (Users) session.getAttribute("user");
            if (user != null) {
                Orders orders = (Orders) shoppingServices.getDraftOrder(user.getUser_id()).getData();
                if (orders != null) {
                    shoppingServices.setBillingAddress(user.getUser_id(), request, orders_id);
                    return "redirect:/checkout";
                }
                return "redirect:/shoping_cart";
            }
        }
        return "redirect:/";
    }

    @RequestMapping("/cancelOrder")
    public String cancelOrder(@RequestParam("order_id") Integer order_id, HttpSession session)
            throws SQLException {
        if (session.getAttribute("user") != null) {
            Users user = (Users) session.getAttribute("user");
            Orders orders = (Orders) shoppingServices.getOrderByStatusAndUserID("checkout", user.getUser_id())
                    .getData();
            if (orders != null) {
                shoppingServices.cancelOrder(order_id);
                return "redirect:/shoping_cart";
            }
            return "redirect:/shoping_cart";
        }
        return "redirect:/";
    }
}
