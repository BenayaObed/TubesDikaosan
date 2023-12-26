package com.TubesDiKaosan.ecommerce.controllers.dashboard;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.TubesDiKaosan.ecommerce.models.Roles;
import com.TubesDiKaosan.ecommerce.models.Users;
import com.TubesDiKaosan.ecommerce.payloads.requests.UserRequest;
import com.TubesDiKaosan.ecommerce.payloads.response.Response;
import com.TubesDiKaosan.ecommerce.services.ActorServices.AdminService;
import com.TubesDiKaosan.ecommerce.services.ActorServices.UsersService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/dashboard/users")
public class AdminController {
    @Autowired
    private List<UsersService> usersServices;

    @RequestMapping({ "", "/" })
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
            Users user = (Users) session.getAttribute("user");
            if (user.getRole().getRole_name().equals("ADMIN")) {
                for (UsersService userService : usersServices) {
                    if (userService instanceof AdminService) {
                        List<Roles> roles = (List<Roles>) ((AdminService) userService).getAllRoles().getData();
                        model.addAttribute("data", roles);

                        return "pages/dashboard/employees_add";
                    }
                }
            }
        }
        return "redirect:/";
    }

    @PostMapping("/save")
    public String create(UserRequest userRequest, Model model, HttpSession session,
            RedirectAttributes redirectAttributes) throws SQLException {
        model.addAttribute("title", "Create User");
        if (session.getAttribute("user") != null) {
            Users user = (Users) session.getAttribute("user");
            if (user.getRole().getRole_name().equals("ADMIN")) {
                for (UsersService userService : usersServices) {
                    if (userService instanceof AdminService) {
                        userService.createData(userRequest);
                        redirectAttributes.addFlashAttribute("alert", "Data berhasil ditambah");
                        return "redirect:/dashboard/users";
                    }
                }
            }
        }
        return "redirect:/";
    }

    @RequestMapping("/edit")
    public String edit(@RequestParam String userID, Model model, HttpSession session) throws SQLException {
        model.addAttribute("title", "Edit User");
        if (session.getAttribute("user") != null) {
            Users user = (Users) session.getAttribute("user");
            if (user.getRole().getRole_name().equals("ADMIN")) {
                for (UsersService userService : usersServices) {
                    if (userService instanceof AdminService) {
                        List<Roles> roles = (List<Roles>) ((AdminService) userService).getAllRoles().getData();
                        Users users = (Users) ((AdminService) userService).findDataByID(userID).getData();
                        model.addAttribute("data", roles);
                        model.addAttribute("user", users);
                        return "pages/dashboard/employees_edit";
                    }
                }
            }
        }
        return "redirect:/";
    }

    @PostMapping("/update")
    public String update(@RequestParam String userID, UserRequest userRequest, Model model, HttpSession session,
            RedirectAttributes redirectAttributes)
            throws SQLException {
        model.addAttribute("title", "Edit User");
        if (session.getAttribute("user") != null) {
            Users user = (Users) session.getAttribute("user");
            if (!user.getRole().getRole_name().equals("ADMIN")) {
                for (UsersService userService : usersServices) {
                    if (userService instanceof AdminService) {
                        Response response = ((AdminService) userService).updateDataById(userID, userRequest);
                        if (response.getStatus() == 200) {
                            redirectAttributes.addFlashAttribute("alert", "Data berhasil diupdate");
                            return "redirect:/dashboard/users";
                        } else {
                            redirectAttributes.addFlashAttribute("alert", "Data gagal diupdate");
                            return "redirect:/dashboard/users/edit?userID=" + userID;
                        }

                    }
                }
            }
        }
        return "redirect:/";
    }

    @RequestMapping("/delete")
    public String delete(@RequestParam String userID, Model model, HttpSession session,
            RedirectAttributes redirectAttributes) throws SQLException {
        model.addAttribute("title", "Delete User");
        if (session.getAttribute("user") != null) {
            for (UsersService userService : usersServices) {
                if (userService instanceof AdminService) {
                    Response response = ((AdminService) userService).deleteDataByID(userID);
                    if (response.getStatus() == 200) {
                        redirectAttributes.addFlashAttribute("alert", "Data gagal didelete");
                        return "redirect:/dashboard/users";
                    } else {
                        redirectAttributes.addFlashAttribute("alert", "Data gagal didelete");
                        return "redirect:/dashboard/users";
                    }

                }
            }
        }
        return "redirect:/";
    }
}
