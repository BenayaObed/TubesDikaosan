package com.TubesDiKaosan.ecommerce.controllers;

import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.ui.Model;

@SpringBootApplication
@Controller
public class HomeController {
    @RequestMapping({ "/", "/home" })
    public String homePage(Model model) {
        model.addAttribute("title", "Home");
        return "pages/fe/homepage";
    }

    @RequestMapping("/shop")
    public String shopPage(Model model) {
        model.addAttribute("title", "Shop");
        return "pages/shop";
    }
}