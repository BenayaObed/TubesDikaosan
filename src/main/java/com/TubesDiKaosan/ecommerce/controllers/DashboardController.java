package com.TubesDiKaosan.ecommerce.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.TubesDiKaosan.ecommerce.services.CategoryService;

@SpringBootApplication
@Controller
@RequestMapping("/dashboard")
public class DashboardController {
    @Autowired
    private CategoryService categoryService;

    // settup model attribute username for all pages
    @RequestMapping({"", "/"})
    public String homePage(Model model) {
        // Create model attribute for title = dashbaord and name = admin name
        model.addAttribute("title", "Dashboard");
        model.addAttribute("username", "Admin");
        return "pages/dashboard/index";
    }
    
    @RequestMapping("/chats")
    public String messagesPage(Model model) {
        model.addAttribute("title", "Messages");
        return "pages/dashboard/chat";
    }
}
