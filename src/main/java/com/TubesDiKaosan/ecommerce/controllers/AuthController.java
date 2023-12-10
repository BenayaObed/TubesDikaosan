package com.TubesDiKaosan.ecommerce.controllers;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

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
    public String login() {
        return "login";
    }
    @RequestMapping("/auth/users")
    public ResponseEntity<?> getAllUsers(Model model) throws SQLException{
        Response response = UsersService.getAll();
        model.addAttribute("user", response.getData());
        return ResponseEntity.ok().body(response); 
    }

    @PostMapping("/auth/register")
    public ResponseEntity<?> registerUser(@RequestBody UserRequest request) throws Exception{
        Response response = UsersService.createData(request);
        return ResponseEntity.ok().body(response);
    }
}
