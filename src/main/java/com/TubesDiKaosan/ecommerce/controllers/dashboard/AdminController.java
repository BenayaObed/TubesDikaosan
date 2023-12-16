package com.TubesDiKaosan.ecommerce.controllers.dashboard;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.TubesDiKaosan.ecommerce.models.Users;
import com.TubesDiKaosan.ecommerce.services.ActorServices.AdminService;
import com.TubesDiKaosan.ecommerce.services.ActorServices.UsersService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/dashboard/users")
public class AdminController {
    @Autowired
    private List<UsersService> usersServices;

    @RequestMapping({"", "/"})
    public String index(Model model, HttpSession session) throws SQLException {
        model.addAttribute("title", "Users");
        if (session.getAttribute("user") != null) {
            Users user = (Users) session.getAttribute("user");
            if (user.getRole().getRole_name().equals("ADMIN")) {
                for (UsersService userService : usersServices) {
                    if (userService instanceof AdminService) {
                        List<Users> users = (List<Users>) ((AdminService) userService).getAll().getData();
                        model.addAttribute("data", users);
                        return "pages/dashboard/employees";
                    }
                }
            }
            return "redirect:/";
        }
        return "redirect:/";
    }

    @RequestMapping("/create")
    public String create(Model model, HttpSession session) throws SQLException {
        model.addAttribute("title", "Create User");
        if (session.getAttribute("user") != null) {
            for (UsersService userService : usersServices) {
                if (userService instanceof AdminService) {
                    return "pages/dashboard/users/employee_create";
                }
            }
        }
        return "redirect:/";
    }

    @RequestMapping("/edit")
    public String edit(@RequestParam String userID, Model model, HttpSession session) throws SQLException {
        model.addAttribute("title", "Edit User");
        if (session.getAttribute("user") != null) {
            for (UsersService userService : usersServices) {
                if (userService instanceof AdminService) {
                    return "pages/dashboard/users/employee_edit";
                }
            }
        }
        return "redirect:/";
    }

    @RequestMapping("/delete")
    public String delete(@RequestParam String userID, Model model, HttpSession session) throws SQLException {
        model.addAttribute("title", "Delete User");
        if (session.getAttribute("user") != null) {
            for (UsersService userService : usersServices) {
                if (userService instanceof AdminService) {
                    return "pages/dashboard/users/employee_delete";
                }
            }
        }
        return "redirect:/";
    }
    
}
