package com.TubesDiKaosan.ecommerce.controllers.dashboard;

import java.sql.SQLException;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.TubesDiKaosan.ecommerce.models.Users;

import jakarta.servlet.http.HttpSession;

public class DashboardController {
    @RequestMapping("/dashboard")
    public String dashboard(Model model, HttpSession session) throws SQLException {
        model.addAttribute("title", "Dashboard");
        // check session admin or not
        if (session.getAttribute("user") != null) {
            Users user = (Users) session.getAttribute("user");
            if (user.getRole().getRole_name().equals("ADMIN")) {
                return "pages/dashboard/index";
            } else if (user.getRole().getRole_name().equals("CUSTOMER")) {
                return "redirect:/";
            }
        }
        return "pages/dashboard/index";
    }
}
