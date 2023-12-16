package com.TubesDiKaosan.ecommerce.controllers.dashboard;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.TubesDiKaosan.ecommerce.models.Category;
import com.TubesDiKaosan.ecommerce.models.Users;
import com.TubesDiKaosan.ecommerce.payloads.requests.CategoryRequest;
import com.TubesDiKaosan.ecommerce.services.ProductServices.CategoryService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/dashboard/categories")
public class CategoriesController {
    @Autowired
    private CategoryService categoriesService;

    @RequestMapping({ "", "/" })
    public String index(Model model, HttpSession session) throws SQLException{
        model.addAttribute("title", "Product");
        if (session.getAttribute("user") != null) {
            Users user = (Users) session.getAttribute("user");
            if (user.getRole().getRole_name().equals("ADMIN")) {
                List<Category> categories = (List<Category>) categoriesService.getAll().getData();
                model.addAttribute("categories", categories);
                return "pages/dashboard/category";
            } else if (user.getRole().getRole_name().equals("CUSTOMER")) {
                return "redirect:/";
            }
        }
        return "redirect:/";
    }

    // START CREATE
    @RequestMapping("/create")
    public String createView(Model model, HttpSession session) throws SQLException{
        model.addAttribute("title", "Create Category");
        if (session.getAttribute("user") != null) {
            Users user = (Users) session.getAttribute("user");
            if (user.getRole().getRole_name().equals("ADMIN")) {
                return "pages/dashboard/category_add";
            } else if (user.getRole().getRole_name().equals("CUSTOMER")) {
                return "redirect:/";
            }
        }
        return "redirect:/";
    }

    @PostMapping("/save")
    public String save(CategoryRequest request, HttpSession session) throws SQLException{
        if (session.getAttribute("user") != null) {
            Users user = (Users) session.getAttribute("user");
            if (user.getRole().getRole_name().equals("ADMIN")) {
                categoriesService.createData(request);
                return "redirect:/dashboard/categories";
            } else if (user.getRole().getRole_name().equals("CUSTOMER")) {
                return "redirect:/";
            }
        }
        return "redirect:/";
    }

    // START UPDATE
    @RequestMapping("/edit")
    public String editView(@RequestParam Integer categoryID, HttpSession session,Model model) throws SQLException{
        model.addAttribute("title", "Edit Category");
        if (session.getAttribute("user") != null) {
            Users user = (Users) session.getAttribute("user");
            if (user.getRole().getRole_name().equals("ADMIN")) {
                Category category = (Category) categoriesService.findDataByID(categoryID).getData();
                model.addAttribute("data", category);
                return "pages/dashboard/category_edit";
            } else if (user.getRole().getRole_name().equals("CUSTOMER")) {
                return "redirect:/";
            }
        }
        return "redirect:/";
    }


    @PostMapping("/update")
    public String update(@RequestParam Integer categoryID, CategoryRequest request, HttpSession session) throws SQLException{
        if (session.getAttribute("user") != null) {
            Users user = (Users) session.getAttribute("user");
            if (user.getRole().getRole_name().equals("ADMIN")) {
                Category category = (Category) categoriesService.findDataByID(categoryID).getData();
                category.setCategory_name(request.getCategory_name());
                category.setVisible(request.getVisible());
                categoriesService.updateDataById(categoryID, request);
                return "redirect:/dashboard/categories/edit?categoryID=" + categoryID;
            } else if (user.getRole().getRole_name().equals("CUSTOMER")) {
                return "redirect:/";
            }
        }
        return "redirect:/";
    }
    // END UPDATE

    // START DELETE (HIDE)
    @RequestMapping("/delete")
    public String delete(@RequestParam Integer categoryID, HttpSession session) throws SQLException{
        if (session.getAttribute("user") != null) {
            Users user = (Users) session.getAttribute("user");
            if (user.getRole().getRole_name().equals("ADMIN")) {
                categoriesService.hideDataByID(categoryID);
                return "redirect:/dashboard/categories";
            } else if (user.getRole().getRole_name().equals("CUSTOMER")) {
                return "redirect:/";
            }
        }
        return "redirect:/";
    }
    // END DELETE (HIDE)
}
