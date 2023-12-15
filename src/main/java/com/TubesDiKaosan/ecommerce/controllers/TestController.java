package com.TubesDiKaosan.ecommerce.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.TubesDiKaosan.ecommerce.models.Users;
import com.TubesDiKaosan.ecommerce.payloads.requests.UserRequest;
import com.TubesDiKaosan.ecommerce.payloads.response.Response;
import com.TubesDiKaosan.ecommerce.services.ActorServices.AdminService;
import com.TubesDiKaosan.ecommerce.services.ActorServices.UsersService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

import static org.junit.jupiter.api.Assertions.assertTrue;

import java.io.File;
import java.sql.SQLException;
import java.util.List;

@SpringBootApplication
@Controller
public class TestController {
    // @Autowired
    // private List<UsersService> usersServices;

    // @Autowired
    // private ResourceLoader resourceLoader;

    // @RequestMapping("/")
    // public String index(Model model, HttpSession session) throws SQLException {
    //     model.addAttribute("title", "Home");
    //     for (UsersService userService : usersServices) {
    //         if (userService instanceof AdminService) {
    //             List<Users> users = (List<Users>) ((AdminService) userService).getAll().getData();
    //             model.addAttribute("users", users);
    //             return "pages/landing/index";
    //         }
    //     }
    //     return "pages/landing/index";
    // }

    // @RequestMapping("/path-test")
    // public ResponseEntity<?> path() {
    //         String path =  "src/main/resources/static/images";

    //         File file = new File(path);
    //         String absolutePath = file.getAbsolutePath();
    //         System.out.println(absolutePath);
    //         return ResponseEntity.ok("ok");
    // }
}
