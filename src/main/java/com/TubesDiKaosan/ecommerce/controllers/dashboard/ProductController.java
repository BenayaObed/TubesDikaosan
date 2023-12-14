package com.TubesDiKaosan.ecommerce.controllers.dashboard;

import java.sql.SQLException;
import java.util.List;
import java.io.File;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.TubesDiKaosan.ecommerce.models.Product;
import com.TubesDiKaosan.ecommerce.models.Users;
import com.TubesDiKaosan.ecommerce.payloads.requests.ImagesProductRequest;
import com.TubesDiKaosan.ecommerce.payloads.requests.ProductRequest;
import com.TubesDiKaosan.ecommerce.services.ProductServices.ProductService;

import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/dashboard")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1,
        maxFileSize = 1024 * 1024 * 2,
        maxRequestSize = 1024 * 1024 * 4
)

public class ProductController {
    @Autowired
    private ProductService productService;

    @RequestMapping("/products")
    public String product(Model model, HttpSession session) throws SQLException {
        model.addAttribute("title", "Product");
        if (session.getAttribute("user") != null) {
            Users user = (Users) session.getAttribute("user");
            if (user.getRole().getRole_name().equals("ADMIN")) {
                List<Product> products = (List<Product>) productService.getAll().getData();
                model.addAttribute("products", products);
                return "pages/dashboard/product/index";
            } else if (user.getRole().getRole_name().equals("CUSTOMER")) {
                return "redirect:/";
            }
        }
        return "pages/dashboard/product/index";
    }

    @RequestMapping("/products/create")
    public String create(Model model, HttpSession session) throws SQLException {
        model.addAttribute("title", "Create Product");
        if (session.getAttribute("user") != null) {
            Users user = (Users) session.getAttribute("user");
            if (user.getRole().getRole_name().equals("ADMIN")) {
                return "pages/dashboard/product/create";
            } else if (user.getRole().getRole_name().equals("CUSTOMER")) {
                return "redirect:/";
            }
        }
        return "pages/dashboard/product/create";
    }

    @PostMapping("/products/save")
    public String create(Model model, HttpSession session, @RequestBody ProductRequest request, @RequestParam("images") List<MultipartFile> files) throws SQLException {
        if (session.getAttribute("user") != null) {
            Users user = (Users) session.getAttribute("user");
            if (user.getRole().getRole_name().equals("ADMIN")) {

                    String uploadDir = "src/main/resources/static/images/product";
                    File dir = new File(uploadDir);
                    if (!dir.exists()) {
                        dir.mkdirs();
                    }
                    
                    List<ImagesProductRequest> images = request.getImages();
                    for (MultipartFile file : files) {
                        String fileName = StringUtils.cleanPath(file.getOriginalFilename());
                        try {
                            ImagesProductRequest image = new ImagesProductRequest();
                            image.setImage(fileName);
                            images.add(image);
                            String filePath = uploadDir + "/" + fileName;
                            File dest = new File(filePath);
                            file.transferTo(dest);
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    }
                    request.setImages(images);
                    productService.createData(request);

                    return "pages/dashboard/product/create";                
            } else if (user.getRole().getRole_name().equals("CUSTOMER")) {
                return "redirect:/";
            }
        }
        return "pages/dashboard/product/create";
    }
}
