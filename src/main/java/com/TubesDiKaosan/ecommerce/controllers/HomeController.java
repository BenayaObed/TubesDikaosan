package com.TubesDiKaosan.ecommerce.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.ui.Model;

import com.TubesDiKaosan.ecommerce.models.Category;
import com.TubesDiKaosan.ecommerce.services.CategoryServiceImplement;

import org.springframework.ui.Model;

@SpringBootApplication
@Controller
public class HomeController {
    @Autowired
    private CategoryServiceImplement category;

    @RequestMapping({ "/", "/home" })
    public String homePage(Model model) {
        model.addAttribute("title", "Home");
        return "pages/fe/homepage";
    }

    
    // @RequestMapping("/shop")
    // public String shopPage(Model model) {
    // model.addAttribute("title", "Shop");
    // return "pages/fe/shop";
    // }

    // @RequestMapping("/shop1")
    // public String shopPage1(Model model) {
    // model.addAttribute("title", "Shop");
    // return "pages/shop";
    // }

}