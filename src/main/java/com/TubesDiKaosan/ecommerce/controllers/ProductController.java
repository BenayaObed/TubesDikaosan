package com.TubesDiKaosan.ecommerce.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.TubesDiKaosan.ecommerce.services.CategoryServiceImplement;
import com.TubesDiKaosan.ecommerce.services.ProductServiceImplement;
import com.TubesDiKaosan.ecommerce.models.Category;
import com.TubesDiKaosan.ecommerce.models.Product;
import com.TubesDiKaosan.ecommerce.payloads.requests.ProductRequest;
import com.TubesDiKaosan.ecommerce.payloads.response.Response;

@SpringBootApplication
@Controller
@RequestMapping("/dashboard")
public class ProductController {
    @Autowired
    private ProductServiceImplement productService;

    @Autowired
    private CategoryServiceImplement categoryService;

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

    // API get all
    @RequestMapping("/api/products")
    public ResponseEntity<?> productsApiAll() {
        try {
            Response data = productService.getAll();
            return ResponseEntity.status(data.getStatus()).body(data);

        } catch (Exception e) {
            return ResponseEntity.status(500).body(e.getMessage());
        }
    }

    // API get by id
    @RequestMapping("/api/products/{uuid}")
    public ResponseEntity<?> productApiFind(@PathVariable("uuid") Integer id) {
        try {
            Response data = productService.getById(id);
            return ResponseEntity.status(data.getStatus()).body(data);

        } catch (Exception e) {
            return ResponseEntity.status(500).body(e.getMessage());
        }
    }

    @RequestMapping("/products/add")
    public String addProductPage(Model model,BindingResult bindingResult) {
        try {
            if (bindingResult.hasErrors()) 
                throw new Exception(bindingResult.getAllErrors().get(0).getDefaultMessage());
            List<Category> data = (List<Category>) categoryService.getAll().getData();
            model.addAttribute("title", "Add Product");
            model.addAttribute("categories", data);
            return "pages/dashboard/product_add";

        } catch (Exception e) {
            System.out.println(e.getMessage());
            return "redirect:/dashboard";
        }
    }

    // API add product
    @PostMapping("/api/products/add/submit")
    public ResponseEntity<?> productApiSubmit(@RequestBody ProductRequest request) {
        try {
            System.out.println(request.getImages());
            Response data = productService.add(request);
            return ResponseEntity.status(data.getStatus()).body(data);

        } catch (Exception e) {
            return ResponseEntity.status(500).body(e.getMessage());
        }
    }

    // API edit product
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

    // API update product
    @PostMapping("/api/products/{uuid}/update")
    public ResponseEntity<?> productApiUpdate(@PathVariable("uuid") Integer id, @RequestBody ProductRequest request) {
        try {
            Response data = productService.updateById(id, request);
            return ResponseEntity.status(data.getStatus()).body(data);

        } catch (Exception e) {
            return ResponseEntity.status(500).body(e.getMessage());
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

    // API delete product
    @RequestMapping("/api/products/delete/{uuid}")
    public ResponseEntity<?> deleteProductApi(@PathVariable("uuid") Integer id) {
        try {
            Response data = productService.deleteById(id);
            return ResponseEntity.ok(data);

        } catch (Exception e) {
            return ResponseEntity.status(500).body(e.getMessage());
        }
    }

    // API search product
    @GetMapping("/api/search")
    public ResponseEntity<?> searchProducts(@RequestParam(required = false, defaultValue = "") String product,
    @RequestParam(required = false, defaultValue = "") String category,
    @RequestParam(required = false, defaultValue = "0") Double price,
    @RequestParam(required = false, defaultValue = "") String color,
    @RequestParam(required = false, defaultValue = "") String size) throws Exception{
        product = product.replace("\"", "");
        category = category.replace("\"", "");
        color = color.replace("\"", "");
        size = size.replace("\"", "");

        Response data = productService.search(product, category, price, color, size);
        return ResponseEntity.status(data.getStatus()).body(data);
    }

    // View Product
    
}
