package com.TubesDiKaosan.ecommerce.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.TubesDiKaosan.ecommerce.services.ProductServiceImplement;
import com.TubesDiKaosan.ecommerce.payloads.response.Response;
import com.TubesDiKaosan.ecommerce.models.Product;

@SpringBootApplication
@Controller
@RequestMapping("/dashboard")
public class ProductController {
    @Autowired
    private ProductServiceImplement productService;

    @RequestMapping("/products")
    public String productsPage(Model model) {
        try {
            model.addAttribute("title", "Products");
            List<Product> data = (List<Product>) productService.getAll().getData();
            model.addAttribute("products", data);
            return "pages/dashboard/product";

        } catch (Exception e) {
            System.out.println(e.getMessage());
            return "redirect:/dashboard";
        }
    }

    @RequestMapping("/products/add")
    public String addProductPage(Model model) {
        try {
            model.addAttribute("title", "Add Product");
            return "pages/dashboard/product_add";

        } catch (Exception e) {
            System.out.println(e.getMessage());
            return "redirect:/dashboard";
        }
    }

    @RequestMapping("/products/edit")
    public String editProductPage(Model model) {
        try {
            model.addAttribute("title", "Edit Product");
            return "pages/dashboard/product_edit";

        } catch (Exception e) {
            System.out.println(e.getMessage());
            return "redirect:/dashboard";
        }
    }

    @RequestMapping("/products/delete/{uuid}")
    public String deleteProductPage(Model model, @PathVariable("uuid") Integer id) {
        try {
            productService.deleteById(id);
            return "pages/dashboard/product";

        } catch (Exception e) {
            System.out.println(e.getMessage());
            return "redirect:/dashboard";
        }
    }

    @RequestMapping("/products/visible")
    public String visibleProductPage(Model model) {
        try {
            model.addAttribute("title", "Visible Product");
            return "pages/dashboard/product_visible";

        } catch (Exception e) {
            System.out.println(e.getMessage());
            return "redirect:/dashboard";
        }
    }
}
