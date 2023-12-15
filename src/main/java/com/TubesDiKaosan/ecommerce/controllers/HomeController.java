package com.TubesDiKaosan.ecommerce.controllers;

import java.sql.SQLException;
import java.util.List;
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardOpenOption;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.TubesDiKaosan.ecommerce.models.Users;
import com.TubesDiKaosan.ecommerce.services.ActorServices.AdminService;
import com.TubesDiKaosan.ecommerce.services.ActorServices.UsersService;

import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpSession;

public class HomeController {
    @Autowired
    private List<UsersService> usersServices;

    @Autowired
    private ServletContext servletContext;

    @Autowired
    private final ResourceLoader resourceLoader;

    public HomeController(ResourceLoader resourceLoader) {
        this.resourceLoader = resourceLoader;
    }

    @RequestMapping("/path")
    public ResponseEntity<String> testResource() throws IOException {
        String path = "src/test/resources";

        File file = new File(path);
        String absolutePath = file.getAbsolutePath();

        System.out.println(absolutePath);

        return ResponseEntity.ok("ok");
    }

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

    @RequestMapping("/")
    public String index(Model model, HttpSession session) throws SQLException {
        model.addAttribute("title", "Home");
        for (UsersService userService : usersServices) {
            if (userService instanceof AdminService) {
                List<Users> users = (List<Users>) ((AdminService) userService).getAll().getData();
                model.addAttribute("users", users);
                return "pages/landing/index";
            }
        }
        return "pages/landing/index";
    }
}
