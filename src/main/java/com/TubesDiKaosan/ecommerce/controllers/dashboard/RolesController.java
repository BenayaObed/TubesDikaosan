package com.TubesDiKaosan.ecommerce.controllers.dashboard;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.TubesDiKaosan.ecommerce.models.Roles;
import com.TubesDiKaosan.ecommerce.models.Users;
import com.TubesDiKaosan.ecommerce.payloads.requests.RoleRequest;
import com.TubesDiKaosan.ecommerce.payloads.response.Response;
import com.TubesDiKaosan.ecommerce.services.ActorServices.RolesService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/dashboard/roles")
public class RolesController {
    @Autowired
    private RolesService rolesService;
    
    @RequestMapping({"", "/"})
    public String index(Model model, HttpSession session) throws SQLException {
        model.addAttribute("title", "Roles");
        if (session.getAttribute("user") != null) {
            Users user = (Users) session.getAttribute("user");
            if (user.getRole().getRole_name().equals("ADMIN")) {
                List<Roles> roles = (List<Roles>) rolesService.getAll().getData();
                model.addAttribute("data", roles);
                return "pages/dashboard/roles";
            }
        }
        return "redirect:/";
    }


    // CREATE PAGE
    @RequestMapping("/create")
    public String create(Model model, HttpSession session) throws SQLException {
        model.addAttribute("title", "Roles");
        if (session.getAttribute("user") != null) {
            Users user = (Users) session.getAttribute("user");
            if (user.getRole().getRole_name().equals("ADMIN")) {
                return "pages/dashboard/roles_add";
            }
        }
        return "redirect:/";
    }

    // POST CREATE
    @PostMapping("/save")
    public String create(RoleRequest request, Model model, HttpSession session) throws SQLException {
        model.addAttribute("title", "Roles");
        if (session.getAttribute("user") != null) {
            Users user = (Users) session.getAttribute("user");
            if (user.getRole().getRole_name().equals("ADMIN")) {
                Response roles = rolesService.createData(request);
                if (roles.getStatus() == 200) 
                    return "redirect:/dashboard/roles";
                return "redirect:/dashboard/roles";
            } else if (user.getRole().getRole_name().equals("CUSTOMER")) {
                return "redirect:/";
            }
        }
        return "redirect:/";
    }

    // UPDATE PAGE
    @RequestMapping("/edit")
    public String update(@RequestParam Integer roleID, Model model, HttpSession session) throws SQLException {
        model.addAttribute("title", "Roles");
        if (session.getAttribute("user") != null) {
            Users user = (Users) session.getAttribute("user");
            if (user.getRole().getRole_name().equals("ADMIN")) {
                Roles roles = (Roles) rolesService.findDataByID(roleID).getData();
                model.addAttribute("data", roles);
                return "pages/dashboard/roles_edit";
            } else if (user.getRole().getRole_name().equals("CUSTOMER")) {
                return "redirect:/";
            }
        }
        return "redirect:/";
    }

    // POST UPDATE
    @PostMapping("/update")
    public String update(@RequestParam Integer roleID, RoleRequest request, Model model, HttpSession session) throws SQLException {
        model.addAttribute("title", "Roles");
        if (session.getAttribute("user") != null) {
            Users user = (Users) session.getAttribute("user");
            if (user.getRole().getRole_name().equals("ADMIN")) {
                rolesService.updateDataById(roleID, request);
                return "redirect:/dashboard/roles";
            } else if (user.getRole().getRole_name().equals("CUSTOMER")) {
                return "redirect:/";
            }
        }
        return "pages/dashboard/product/update";
    }

    // DELETE
    @RequestMapping("/delete")
    public String delete(@RequestParam Integer roleID, Model model, HttpSession session) throws SQLException {
        model.addAttribute("title", "Roles");
        if (session.getAttribute("user") != null) {
            Users user = (Users) session.getAttribute("user");
            if (user.getRole().getRole_name().equals("ADMIN")) {
                Response roles = rolesService.deleteDataByID(roleID);
                if (roles.getStatus() == 200) {
                    return "redirect:/dashboard/roles";
                }
                return "redirect:/dashboard/roles";
            } else if (user.getRole().getRole_name().equals("CUSTOMER")) {
                return "redirect:/";
            }
        }
        return "redirect:/";
    }

}
