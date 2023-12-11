package com.TubesDiKaosan.ecommerce.controllers;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.TubesDiKaosan.ecommerce.payloads.requests.UserRequest;
import com.TubesDiKaosan.ecommerce.payloads.response.Response;
import com.TubesDiKaosan.ecommerce.services.UsersService;

@SpringBootApplication
@Controller
@RequestMapping("/api")
public class AuthController {
    @Autowired
    private UsersService UsersService;

    @RequestMapping("/login")
    public String showLoginPage(Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (!(auth instanceof AnonymousAuthenticationToken)) {
            String name = auth.getName();
            String role = auth.getAuthorities().toString();
            System.out.println(name + " " + role);
            return "redirect:/";
        }
        return "pages/login";
    }

    @RequestMapping("/register")
    public String showRegisterPage(Model model) {
        return "pages/register";
    }

    @RequestMapping("/logout")
    public String logout(Model model) {
        return "redirect:/login";
    }

    @PostMapping("/registration")
    public String registerUserSubmit(@ModelAttribute UserRequest request, Model model) throws Exception {
        request.setRole(1);
        Response response = UsersService.createData(request);
        if (response.getStatus() == 200) {
            return "redirect:/";
        }
        return "redirect:/api/login";
    }

    @RequestMapping("/auth/users")
    public ResponseEntity<?> getAllUsers(Model model) throws SQLException {
        Response response = UsersService.getAll();
        model.addAttribute("user", response.getData());
        return ResponseEntity.ok().body(response);
    }

    @PostMapping("/auth/register")
    public ResponseEntity<?> registerUser(@RequestBody UserRequest request) throws Exception {
        Response response = UsersService.createData(request);
        return ResponseEntity.ok().body(response);
    }
}
