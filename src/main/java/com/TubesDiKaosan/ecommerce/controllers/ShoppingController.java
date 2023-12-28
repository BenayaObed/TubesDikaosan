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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
    public String addToCart(@RequestParam("product_id") Integer product_id, @RequestParam(name ="colors", required = false) String color,
            @RequestParam(name = "sizes", required = false) String size, HttpSession session,RedirectAttributes redirectAttributes)
            throws SQLException {
        if (session.getAttribute("user") != null) {
            if (color == null || size == null) {
                redirectAttributes.addFlashAttribute("message", "Please select color and size");
                return "redirect:/description?product=" + product_id;
            }
            Users user = (Users) session.getAttribute("user");
            Orders container_draft = (Orders) shoppingServices.getOrderByStatusAndUserID("checkout", user.getUser_id())
                    .getData();
            if (container_draft == null) {
                container_draft = (Orders) shoppingServices.getDraftOrder(user.getUser_id()).getData();
                if (container_draft == null)
                    container_draft = (Orders) shoppingServices.createDraftOrder(user).getData();
            }
            Product product = (Product) ProductService.findDataByID(product_id).getData();
            OrderItemRequest request = new OrderItemRequest(product_id, color, size, 1,
                    (float) (product.getPrice() * 1));
            shoppingServices.addOrderItem(request, container_draft);
            return "redirect:/shoping_cart";
        }
        return "redirect:/";
    }

    // update cart
    @PostMapping("/updateCart")
    public String updateCart(@RequestParam(name = "order_item_id", required=false) List<Integer> order_item_id, RedirectAttributes redirectAttributes,
            @RequestParam(name = "quantity", required=false) List<Integer> quantity, @RequestParam(name = "product_id", required=false) List<Integer> product_id)
            throws SQLException {
                if (order_item_id.size() < 1 || product_id.size()<1){
            redirectAttributes.addFlashAttribute("alert", "Barang dalam keranjang tidak tersedia ^_^");
            return "redirect:/shoping_cart";
        }
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

    @RequestMapping("/deleteCart")
    public String deleteCart(@RequestParam("item-cart") Integer item_cart,RedirectAttributes redirectAttributes) throws SQLException {
        if (item_cart != null){
            Response response = shoppingServices.deleteOrderItem(item_cart);
            if (response.getStatus() == 200){
                redirectAttributes.addFlashAttribute("message", "Item has been deleted");
                return "redirect:/shoping_cart";
            }
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
