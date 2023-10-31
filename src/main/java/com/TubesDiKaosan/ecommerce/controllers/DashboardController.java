package com.TubesDiKaosan.ecommerce.controllers;

import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@SpringBootApplication
@Controller
@RequestMapping("/dashboard")
public class DashboardController {
    @RequestMapping({"", "/"})
    public String homePage(Model model) {
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
