package com.TubesDiKaosan.ecommerce.controllers;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.kafka.KafkaProperties.Admin;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.TubesDiKaosan.ecommerce.models.Orders;
import com.TubesDiKaosan.ecommerce.models.OrdersItem;
import com.TubesDiKaosan.ecommerce.models.Product;
import com.TubesDiKaosan.ecommerce.models.Stock;
import com.TubesDiKaosan.ecommerce.models.Users;
import com.TubesDiKaosan.ecommerce.payloads.response.Response;
import com.TubesDiKaosan.ecommerce.services.ActorServices.AdminService;
import com.TubesDiKaosan.ecommerce.services.ActorServices.CustomerService;
import com.TubesDiKaosan.ecommerce.services.ActorServices.UsersService;
import com.TubesDiKaosan.ecommerce.services.ProductServices.ProductService;

import jakarta.servlet.http.HttpSession;

@Controller
public class LandingController {
    @Autowired
    private List<UsersService> usersServices;

    @Autowired
    private ProductService productService;

    @RequestMapping({ "/", "/home" })
    public String index(Model model, HttpSession session) throws SQLException {
        model.addAttribute("title", "Home");
        for (UsersService userService : usersServices) {
            if (userService instanceof UsersService) {
                List<Product> products = (List<Product>) productService.getAll().getData();
                model.addAttribute("products", products);
                return "pages/fe/homepage";
            }
        }
        return "pages/fe/homepage";
    }

    @RequestMapping("/shop")
    public String shop(Model model, HttpSession session) throws SQLException {
        model.addAttribute("title", "Shop");
        for (UsersService userService : usersServices) {
            if (userService instanceof UsersService) {
                return "pages/fe/shop";
            }
        }
        return "pages/fe/shop";
    }

    @RequestMapping("/contact")
    public String contact(Model model, HttpSession session) throws SQLException {
        model.addAttribute("title", "Contact");
        for (UsersService userService : usersServices) {
            if (userService instanceof UsersService) {
                return "pages/fe/contact";
            }
        }
        return "pages/fe/about";
    }

    @RequestMapping("/description")
    public String deskription(@RequestParam Integer product, Model model, HttpSession session) throws SQLException {
        model.addAttribute("title", "Description");
        Product data_product = (Product) productService.findDataByID(product).getData();
        Map<String, Object> data = new HashMap<>();

        for (Stock stock : data_product.getStock()) {
            if (data.containsKey(stock.getColor())) {
                Map<String, Object> size = (Map<String, Object>) data.get(stock.getColor());
                size.put(stock.getSize(), stock.getQuantity());
                data.put(stock.getColor(), size);
            } else {
                data.put(stock.getColor(), new HashMap<String, Object>() {
                    {
                        put("S", stock.getSize().equals("S") ? stock.getQuantity() : "0");
                        put("M", stock.getSize().equals("M") ? stock.getQuantity() : "0");
                        put("L", stock.getSize().equals("L") ? stock.getQuantity() : "0");
                        put("XL", stock.getSize().equals("XL") ? stock.getQuantity() : "0");
                    }
                });
            }
        }
        model.addAttribute("data_stock", data);
        model.addAttribute("data", data_product);
        return "pages/fe/description";
    }

    @RequestMapping("/checkout")
    public String checkout(Model model, HttpSession session) throws SQLException {
        model.addAttribute("title", "Checkout");
        for (UsersService userService : usersServices) {
            if (userService instanceof UsersService) {
                return "pages/fe/checkout";
            }
        }
        return "pages/fe/about";
    }

    @RequestMapping("/shoping_cart")
    public String shoping_cart(Model model, HttpSession session) throws SQLException {
        model.addAttribute("title", "Shoping_Cart");
        if (session.getAttribute("user") != null) {
            Users user = (Users) session.getAttribute("user");
            for (UsersService userService : usersServices) {
                if (userService instanceof CustomerService) {
                    Orders orders = (Orders) ((CustomerService) userService).getDraftOrder(user.getUser_id()).getData();
                    List<OrdersItem> ordersItems = (List<OrdersItem>) ((CustomerService) userService)
                            .getDataCart(orders.getOrder_id(), user.getUser_id()).getData();
                    model.addAttribute("data_cart", ordersItems);
                    model.addAttribute("data_orders", orders);
                    return "pages/fe/shoping_cart";
                }
            }
        }
        return "redirect:/";
    }

    @RequestMapping("/payment")
    public String payment(Model model, HttpSession session) throws SQLException {
        model.addAttribute("title", "Payment");
        for (UsersService userService : usersServices) {
            if (userService instanceof UsersService) {
                return "pages/fe/payment";
            }
        }
        return "redirect:/";
    }

    @RequestMapping("/api/search")
    public ResponseEntity<?> api(@RequestParam String keyword, Model model) throws SQLException {
        List<Product> products = (List<Product>) productService.searchProduct(keyword).getData();
        return ResponseEntity.ok(products);
    }
}
