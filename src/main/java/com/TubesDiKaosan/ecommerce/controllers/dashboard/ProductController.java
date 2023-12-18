package com.TubesDiKaosan.ecommerce.controllers.dashboard;

import java.util.ArrayList;

import java.sql.SQLException;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;

import java.util.List;
import java.util.HashMap;
import java.util.Map;
import java.util.Iterator;

import org.hibernate.engine.internal.Collections;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.core.io.Resource;
import org.springframework.util.ResourceUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.TubesDiKaosan.ecommerce.models.Category;
import com.TubesDiKaosan.ecommerce.models.Product;
import com.TubesDiKaosan.ecommerce.models.Stock;
import com.TubesDiKaosan.ecommerce.models.Users;
import com.TubesDiKaosan.ecommerce.payloads.requests.ImagesProductRequest;
import com.TubesDiKaosan.ecommerce.payloads.requests.ProductRequest;
import com.TubesDiKaosan.ecommerce.payloads.requests.StockProductRequest;
import com.TubesDiKaosan.ecommerce.services.ActorServices.UsersService;
import com.TubesDiKaosan.ecommerce.services.ProductServices.CategoryService;
import com.TubesDiKaosan.ecommerce.services.ProductServices.ProductService;

import jakarta.servlet.ServletContext;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/dashboard/products")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 1, maxFileSize = 1024 * 1024 * 2, maxRequestSize = 1024 * 1024 * 4)

public class ProductController {
    @Autowired
    private ProductService productService;

    @Autowired
    private CategoryService categoryService;
    
    @RequestMapping({ "", "/" })
    public String index(Model model, HttpSession session) throws SQLException {
        model.addAttribute("title", "Product");
        if (session.getAttribute("user") != null) {
            Users user = (Users) session.getAttribute("user");
            if (user.getRole().getRole_name().equals("ADMIN")) {
                List<Product> products = (List<Product>) productService.getAll().getData();
                model.addAttribute("products", products);
                return "pages/dashboard/product";
            } else if (user.getRole().getRole_name().equals("CUSTOMER")) {
                return "redirect:/";
            }
        }
        return "redirect:/";
    }

    @RequestMapping("/create")
    public String createPage(Model model, HttpSession session) throws SQLException {
        model.addAttribute("title", "Create Product");
        if (session.getAttribute("user") != null) {
            Users user = (Users) session.getAttribute("user");
            if (user.getRole().getRole_name().equals("ADMIN")) {
                List<Category> categories = (List<Category>) categoryService.getAll().getData();
                model.addAttribute("categories", categories);
                return "pages/dashboard/product_add";
            } else if (user.getRole().getRole_name().equals("CUSTOMER")) {
                return "redirect:/";
            }
        }
        return "redirect:/";
    }

    @PostMapping("/save")
    public String create(@RequestParam("name_product") String name_product,
            @RequestParam("category_id") Integer category_id,
            @RequestParam("description") String description,
            @RequestParam("price") Integer price,
            @RequestParam("visible") String visible,
            @RequestParam("images") List<MultipartFile> files,
            @RequestParam("color[]") List<String> color,
            @RequestParam("size[S][]") List<String> sizeS,
            @RequestParam("size[M][]") List<String> sizeM,
            @RequestParam("size[L][]") List<String> sizeL,
            @RequestParam("size[XL][]") List<String> sizeXL,
            Model model, HttpSession session) throws SQLException {
        if (session.getAttribute("user") != null) {
            ProductRequest request = new ProductRequest();
            Users user = (Users) session.getAttribute("user");
            if (user.getRole().getRole_name().equals("ADMIN")) {
                List<ImagesProductRequest> images = new ArrayList<>();
                String path = "src/main/resources/static/uploads/images/products";
                File dirPath = new File(path);
                if (!dirPath.exists()) {
                    dirPath.mkdirs();
                }
                for (MultipartFile file : files) {
                    String fileName = StringUtils.cleanPath(file.getOriginalFilename());
                    fileName = System.currentTimeMillis() + fileName;
                    if (fileName.equals(""))
                        continue;
                    try {
                        Path filePath = Path.of(path + "/" + fileName);
                        System.out.println(filePath);
                        ImagesProductRequest image = new ImagesProductRequest();
                        image.setImage(fileName);
                        images.add(image);
                        Files.copy(file.getInputStream(), filePath);
                    } catch (Exception e) {
                        System.out.println(e);
                        e.printStackTrace();
                    }
                }

                Object[][] stock = new Object[][] {
                        { "S", sizeS },
                        { "M", sizeM },
                        { "L", sizeL },
                        { "XL", sizeXL }
                };

                List<StockProductRequest> stocks = new ArrayList<>();
                for (int i = 0; i < color.size(); i++) {
                    for (int j = 0; j < stock.length; j++) {
                        StockProductRequest stockProductRequest = new StockProductRequest();
                        if (color.get(i).equals("") || ((List<String>) stock[j][1]).get(i).equals(""))
                            continue;
                        stockProductRequest.setColor(color.get(i));
                        if (Integer.parseInt(((List<String>) stock[j][1]).get(i)) < 1)
                            continue;
                        stockProductRequest.setQuantity(Integer.parseInt(((List<String>) stock[j][1]).get(i)));
                        stockProductRequest.setSize((String) stock[j][0]);
                        stocks.add(stockProductRequest);
                    }
                }
                request.setName_product(name_product);
                request.setCategory_id(category_id);
                request.setDescription(description);
                request.setPrice(price);
                // parset to int
                request.setVisible(visible.equals("visible") ? 1 : 0);
                request.setImages(images);
                request.setStock(stocks);

                productService.createData(request);

                return "redirect:/dashboard/products";
            } else if (user.getRole().getRole_name().equals("CUSTOMER")) {
                return "redirect:/";
            }
        }
        return "redirect:/";
    }

    @RequestMapping("/edit")
    public String pageUpdate(@RequestParam Integer productID, ProductRequest productRequest, Model model,
            HttpSession session) throws SQLException {
        model.addAttribute("title", "Update Product");
        if (session.getAttribute("user") != null) {
            Users user = (Users) session.getAttribute("user");
            if (user.getRole().getRole_name().equals("ADMIN")) {
                Product product = (Product) productService.findDataByID(productID).getData();
                List<Category> categories = (List<Category>) categoryService.getAll().getData();

                Map<String, Object> data = new HashMap<>();
                for (Stock stock : product.getStock()) {
                    // check color value is exist or not
                    if (data.containsKey(stock.getColor())) {
                        Map<String, Object> size = (Map<String, Object>) data.get(stock.getColor());
                        size.put(stock.getSize(), stock.getQuantity());
                        data.put(stock.getColor(), size);
                    } else {
                        data.put(stock.getColor(), new HashMap<String, Object>() {
                            {
                                put("S", stock.getSize().equals("S") ? stock.getQuantity() : "0");
                                put("M", stock.getSize().equals("M") ? stock.getQuantity() : "0");
                                put("L", stock.getSize().equals("L") ? stock.getQuantity() : "0");
                                put("XL", stock.getSize().equals("XL") ? stock.getQuantity() : "0");
                            }
                        });
                    }
                }

                // data reverse untuk mengurutkan dari belakang ke depan
                model.addAttribute("product", product);
                model.addAttribute("categories", categories);
                model.addAttribute("stocks", data);
                return "pages/dashboard/product_edit";
            } else if (user.getRole().getRole_name().equals("CUSTOMER")) {
                return "redirect:/";
            }
        }
        return "redirect:/";
    }

    @RequestMapping("/delete")
    public String delete(@RequestParam Integer productID, Model model, HttpSession session) throws SQLException {
        if (session.getAttribute("user") != null) {
            Users user = (Users) session.getAttribute("user");
            if (user.getRole().getRole_name().equals("ADMIN")) {
                productService.hideProduct(productID);
                return "redirect:/dashboard/products";
            } else if (user.getRole().getRole_name().equals("CUSTOMER")) {
                return "redirect:/";
            }
        }
        return "redirect:/";
    }

    @RequestMapping("/search")
    public String search(@RequestParam String keyword, Model model, HttpSession session) throws SQLException {
        model.addAttribute("title", "Product");
        if (session.getAttribute("user") != null) {
            Users user = (Users) session.getAttribute("user");
            if (user.getRole().getRole_name().equals("ADMIN")) {
                List<Product> products = (List<Product>) productService.searchProduct(keyword).getData();
                model.addAttribute("products", products);
                return "pages/dashboard/product";
            } else if (user.getRole().getRole_name().equals("CUSTOMER")) {
                return "redirect:/";
            }
        }
        return "redirect:/";
    }
}
