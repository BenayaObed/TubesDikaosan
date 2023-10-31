package com.TubesDiKaosan.ecommerce.controllers;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.TubesDiKaosan.ecommerce.models.Category;
import com.TubesDiKaosan.ecommerce.payloads.requests.CategoryRequest;
import com.TubesDiKaosan.ecommerce.payloads.response.Response;
import com.TubesDiKaosan.ecommerce.services.CategoryServiceImplement;

@SpringBootApplication
@Controller
@RequestMapping("/dashboard")
public class CategoryController{
    @Autowired
    private CategoryServiceImplement categoryService;
    
    @RequestMapping("/categories")
    public String categoriesPage(Model model) throws SQLException{
        try {
            model.addAttribute("title", "Categories");
            List<Category> data = (List<Category>) categoryService.getAll().getData();
            model.addAttribute("categories", data);
            return "pages/dashboard/category";
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return "redirect:/dashboard";
        }
    }

    @RequestMapping("/api/categories")
    public ResponseEntity<?> categoriesAPI(Model model) throws SQLException{
        try {
            Response response = categoryService.getAll();
            return ResponseEntity.status(200).body(response);
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return null;
        }
    }

    // View add Category page
    @RequestMapping("/categories/add")
    public String addCategoryPage(Model model) throws SQLException{
        try {
            model.addAttribute("title", "Create category");
            return "pages/dashboard/category_add";
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return "redirect:/dashboard/categories";
        }
    }
    @PostMapping("/categories/add/submit")
    public String addCategory_save(@ModelAttribute("/categories/add/submit") CategoryRequest request, Model model) throws SQLException {
        try {
            categoryService.add(request);
            return "redirect:/dashboard/categories";
        } catch (Exception e) {
            model.addAttribute("status", categoryService.add(request).getStatus());
            System.out.println(categoryService.add(request).getStatus());
            return "redirect:/dashboard/categories/add";
        }
    }

    // View edit Category page
    @RequestMapping("/categories/edit/{uuid}")
    public String editCategoryPage(Model model, @PathVariable("uuid") Integer id) throws SQLException {
        try {
            model.addAttribute("title", "Update category");
            Category data = (Category) categoryService.getById(id).getData();
            model.addAttribute("data", data);
            return "pages/dashboard/category_edit";
        } catch (Exception e) {
            model.addAttribute("status", categoryService.getById(id).getStatus());
            System.out.println(categoryService.getById(id).getStatus());
            return "redirect:/dashboard/categories";
        }
    }
    
    @PostMapping("/categories/update/{uuid}")
    public String editCategory_save(@ModelAttribute("category") CategoryRequest request, @PathVariable("uuid") Integer id, Model model) throws SQLException {
        try {
            categoryService.updateById(id, request);
            return "redirect:/dashboard/categories";
        } catch (Exception e) {
            model.addAttribute("status", categoryService.updateById(id, request).getStatus());
            System.out.println(categoryService.updateById(id, request).getStatus());

            return "redirect:/dashboard/categories/edit/" + id;
        }
    }

    // Delete Category
    @RequestMapping("/category/delete/{uuid}")
    public String deleteCategory(@PathVariable("uuid") Integer id, Model model) throws SQLException{
        try {
            categoryService.deleteById(id);
            model.addAttribute("status", categoryService.deleteById(id).getStatus());
            return "redirect:/dashboard/categories";
        } catch (Exception e) {
            model.addAttribute("status", categoryService.deleteById(id).getStatus());
            return "redirect:/dashboard/categories";
        }
    }
}
