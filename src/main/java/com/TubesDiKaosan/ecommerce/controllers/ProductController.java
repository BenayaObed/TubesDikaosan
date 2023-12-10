package com.TubesDiKaosan.ecommerce.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.TubesDiKaosan.ecommerce.payloads.requests.ProductRequest;
import com.TubesDiKaosan.ecommerce.payloads.response.Response;
import com.TubesDiKaosan.ecommerce.services.CategoryService;
import com.TubesDiKaosan.ecommerce.services.ProductService;

@Controller
@RequestMapping("/api")
public class ProductController {
    
    @Autowired(required = true)
    private ProductService productService;

    @Autowired
    private CategoryService categoryService;

    @GetMapping("/products")
    public ResponseEntity<?> getAllProducts() throws Exception {
        Response response = productService.getAll();
        return ResponseEntity.ok().body(response);
    }

    @GetMapping("/products/search")
    public ResponseEntity<?> searchProduct(@RequestParam String keyword) throws Exception {
        if (categoryService.findCategoryByName(keyword).getData() != null) {
            Response response = productService.searchProduct(keyword);
            return ResponseEntity.ok().body(response);
        } else {
            Response response = productService.searchProduct(keyword);
            return ResponseEntity.ok().body(response);
        }
    }

    @PostMapping("/products/submit")
    public ResponseEntity<?> submitProduct(@RequestBody ProductRequest productRequest) throws Exception {
        Response response = productService.createData(productRequest);
        return ResponseEntity.ok().body(response);
    }

    @PostMapping("/products/update")
    public ResponseEntity<?> updateProduct(@RequestBody ProductRequest productRequest, @RequestParam Integer id) throws Exception {
        Response response = productService.updateDataById(id,productRequest);
        return ResponseEntity.ok().body(response);
    }

    @DeleteMapping("/products/delete")
    public ResponseEntity<?> deleteProduct(@RequestParam Integer id) throws Exception {
        Response response = productService.deleteDataByID(id);
        return ResponseEntity.ok().body(response);
    }

    @GetMapping("/products/product")
    public ResponseEntity<?> getProductById(@RequestParam Integer id) throws Exception {
        Response response = productService.findDataByID(id);
        return ResponseEntity.ok().body(response);
    }
}
