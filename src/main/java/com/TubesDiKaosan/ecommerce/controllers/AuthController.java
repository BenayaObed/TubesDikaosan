package com.TubesDiKaosan.ecommerce.controllers;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.TubesDiKaosan.ecommerce.models.Roles;
import com.TubesDiKaosan.ecommerce.models.Users;
import com.TubesDiKaosan.ecommerce.payloads.requests.UserRequest;
import com.TubesDiKaosan.ecommerce.payloads.response.Response;
import com.TubesDiKaosan.ecommerce.services.ActorServices.CustomerService;
import com.TubesDiKaosan.ecommerce.services.ActorServices.UsersService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class AuthController {
    @Autowired
    private List<UsersService> usersServices;

    @RequestMapping("/login")
    public String login(Model model, HttpSession session) throws SQLException {
        model.addAttribute("title", "Login");
        if (session.getAttribute("user") != null) {
            Users user = (Users) session.getAttribute("user");
            if (user.getRole().getRole_name().equals("ADMIN")) {
                return "redirect:/dashboard";
            } else if (user.getRole().getRole_name().equals("CUSTOMER")) {
                return "redirect:/";
            }
        }
        return "pages/login";
    }

    @RequestMapping("/register")
    public String register(Model model, HttpSession session) throws SQLException {
        model.addAttribute("title", "Register");
        return "pages/register";
    }

    // REGISTER FOR CUSTOMER
    @PostMapping("/registration")
    public String registration(@Valid UserRequest UserRequest, Model model, HttpSession session,RedirectAttributes redirectAttributes) throws SQLException {
        UserRequest.setRole(-1);
        for (UsersService userService : usersServices) {
            if (userService instanceof CustomerService) {
                Roles role_id = (Roles) ((CustomerService) userService).getRolesCustomer().getData();
                UserRequest.setRole(role_id.getRole_id());
                Response response = ((CustomerService) userService).createData(UserRequest);
                if (response.getMessage().equals("Email already exist")) {
                    redirectAttributes.addFlashAttribute("alert", "Email sudah terdaftar");
                    return "pages/register";
                }
                    redirectAttributes.addFlashAttribute("alert", "Registrasi berhasil");
                    return "redirect:/";
            }
        }
        return "redirect:/";
    }

    // auth login
    @PostMapping("/authentication")
    public String authtentication(
            RedirectAttributes redirectAttributes,
            @RequestParam("Email") String Email,
            @RequestParam("password") String password, Model model,
            HttpSession session) throws SQLException {

        for (UsersService userService : usersServices) {
            if (userService instanceof UsersService) {
                Response response = ((UsersService) userService).login(Email, password);
                if (response.getMessage().equals("success")) {
                    Users user = (Users) response.getData();
                    session.setAttribute("user", user);
                    if (user.getRole().getRole_name().equals("ADMIN")) {
                        return "redirect:/dashboard";
                    } else if (user.getRole().getRole_name().equals("CUSTOMER")) {
                        return "redirect:/";
                    }
                } else {
                    redirectAttributes.addFlashAttribute("alert", "salah password atau email ^_^");
                    return "redirect:/";
                }
            }
        }
        return "redirect:/login";

    }

    @PostMapping("/update-password")
    public String updatePassword(@RequestParam("oldPass") String oldPass,
            @RequestParam("newPass") String newPass, @RequestParam("confirmPass") String confirmPass,
            @RequestParam("user_id") String user_id, Model model, HttpSession session, RedirectAttributes redirectAttributes) throws SQLException {
        for (UsersService userService : usersServices) {
            if (userService instanceof UsersService) {
                Response response = ((UsersService) userService).findDataByID(user_id);
                if (!response.getMessage().equals("Data not found")) {
                    Users user = (Users) response.getData();
                    if (user.getPassword().equals(oldPass)) {
                        if (newPass.equals(confirmPass)) {
                            user.setPassword(newPass);
                            UserRequest userRequest = new UserRequest();
                            userRequest.setFirst_name(user.getFirst_name());
                            userRequest.setLast_name(user.getLast_name());
                            userRequest.setEmail(user.getEmail());
                            userRequest.setPassword(newPass);
                            userRequest.setRole(user.getRole_id());

                            Response update_response = ((UsersService) userService).updateDataById(user_id, userRequest);
                            if (update_response.getStatus() == 200) {
                                session.setAttribute("user", user);
                                redirectAttributes.addFlashAttribute("alert", "Password berhasil dirubah");
                                return "redirect:/";
                            }
                            redirectAttributes.addFlashAttribute("alert", "Password gagal dirubah");
                            return "redirect:/";
                        } else {
                            // password not match
                            redirectAttributes.addFlashAttribute("alert", "Password yang baru tidak sesuai ^_^");
                            return "redirect:/";
                        }
                    } else {
                        // old password not match
                        redirectAttributes.addFlashAttribute("alert", "Password yang lama tidak sesuai ^_^");
                        return "redirect:/";
                    }
                }
            }
        }
        return "redirect:/";
    }

    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        if (session.getAttribute("user") != null) {
            session.removeAttribute("user");
            session.invalidate();
            return "redirect:/";
        }
        return "redirect:/";
    }
}
