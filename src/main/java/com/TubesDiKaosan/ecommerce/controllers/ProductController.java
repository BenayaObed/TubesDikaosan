package com.TubesDiKaosan.ecommerce.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.TubesDiKaosan.ecommerce.services.ProductService;
import com.TubesDiKaosan.ecommerce.payloads.response.Response;
import com.TubesDiKaosan.ecommerce.models.Product;

@SpringBootApplication
@Controller
@RequestMapping("/dashboard")
public class ProductController {
    @Autowired
    private ProductService productService;

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

    @RequestMapping("/api/products")
    public ResponseEntity<?> productsAPI(Model model) {
        try {
            Response response = productService.getAll();
            return ResponseEntity.status(200).body(response);
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return null;
        }
    }
}
