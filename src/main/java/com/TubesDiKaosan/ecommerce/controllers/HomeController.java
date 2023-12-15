package com.TubesDiKaosan.ecommerce.controllers;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.TubesDiKaosan.ecommerce.models.Users;
import com.TubesDiKaosan.ecommerce.services.ActorServices.UsersService;

import jakarta.servlet.http.HttpSession;

public class HomeController {
    @Autowired
    private List<UsersService> usersServices;

    @RequestMapping({ "/", "/home" })
    public String index(Model model, HttpSession session) throws SQLException {
        model.addAttribute("title", "Home");
        for (UsersService userService : usersServices) {
            if (userService instanceof UsersService) {
                List<Users> users = (List<Users>) ((UsersService) userService).getAll().getData();
                model.addAttribute("users", users);
                return "pages/landing/index";
            }
        }
        return "pages/landing/index";
    }

    @RequestMapping("/dashboard")
    public String dashboard(Model model, HttpSession session) throws SQLException {
        model.addAttribute("title", "Dashboard");
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
