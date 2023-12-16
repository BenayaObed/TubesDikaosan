package com.TubesDiKaosan.ecommerce.controllers;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.TubesDiKaosan.ecommerce.models.Product;
import com.TubesDiKaosan.ecommerce.models.Users;
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
    public String deskription(Model model, HttpSession session) throws SQLException {
        model.addAttribute("title", "Description");
        for (UsersService userService : usersServices) {
            if (userService instanceof UsersService) {
                return "pages/fe/description";
            }
        }
        return "pages/fe/about";
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
        for (UsersService userService : usersServices) {
            if (userService instanceof UsersService) {
                return "pages/fe/shoping_cart";
            }
        }
        return "pages/fe/about";
    }

    @RequestMapping("/payment")
    public String payment(Model model, HttpSession session) throws SQLException {
        model.addAttribute("title", "Payment");
        for (UsersService userService : usersServices) {
            if (userService instanceof UsersService) {
                return "pages/fe/payment";
            }
        }
        return "pages/fe/about";
    }

}
