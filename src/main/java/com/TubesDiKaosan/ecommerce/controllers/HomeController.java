package com.TubesDiKaosan.ecommerce.controllers;

import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.ui.Model;

@SpringBootApplication
@Controller
public class HomeController{

    @RequestMapping("/login")
    public String loginPage(Model model) {
        model.addAttribute("title", "Login");
        return "pages/login";
    }
    @RequestMapping({"/", "/home"})
    public String homePage(Model model) {
        model.addAttribute("title", "Home");
        return "pages/landing/index";
    }
}