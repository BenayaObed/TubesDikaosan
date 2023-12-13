package com.TubesDiKaosan.ecommerce.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.TubesDiKaosan.ecommerce.models.Users;
import com.TubesDiKaosan.ecommerce.payloads.response.Response;
import com.TubesDiKaosan.ecommerce.services.ActorServices.AdminService;
import com.TubesDiKaosan.ecommerce.services.ActorServices.CustomerService;
import com.TubesDiKaosan.ecommerce.services.ActorServices.UsersService;

import jakarta.servlet.http.HttpSession;

import java.sql.SQLException;
import java.util.List;

@SpringBootApplication
@Controller
public class TestController {
    @Autowired
    private List<UsersService> usersServices;

    @RequestMapping("/accessAdminMethod")
    public ResponseEntity<?> accessAdminMethod() throws SQLException {
        for (UsersService userService : usersServices) {
            if (userService instanceof AdminService) {
                AdminService adminService = (AdminService) userService;
                List<Users> users = (List<Users>) adminService.getAll().getData();
                return ResponseEntity.ok(users);
            }
        }
        return ResponseEntity.notFound().build();
    }

    // Customer method
    @RequestMapping("/accessCustomerMethod")
    public ResponseEntity<?> accessCustomerMethod() throws SQLException {
        for (UsersService userService : usersServices) {
            if (userService instanceof CustomerService) {
                Response response = ((CustomerService) userService).getAll();
                return ResponseEntity.ok(response);
            }
        }
        return ResponseEntity.notFound().build();
    }
}

