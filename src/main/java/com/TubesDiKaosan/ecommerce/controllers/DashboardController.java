package com.TubesDiKaosan.ecommerce.controllers;

import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@SpringBootApplication
@Controller
@RequestMapping("/dashboard")
public class DashboardController {
    // fix routing /doashboard and /dashboard/
    @RequestMapping({"", "/"})
    public String homePage(Model model) {
        model.addAttribute("title", "Dashboard");
        return "pages/dashboard/index";
    }
}
