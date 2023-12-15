package com.TubesDiKaosan.ecommerce.controllers.dashboard;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;

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
import com.TubesDiKaosan.ecommerce.models.Users;
import com.TubesDiKaosan.ecommerce.payloads.requests.ImagesProductRequest;
import com.TubesDiKaosan.ecommerce.payloads.requests.ProductRequest;
import com.TubesDiKaosan.ecommerce.payloads.requests.StockProductRequest;
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

    @Autowired
    private ServletContext servletContext;

    @Autowired
    private ResourceLoader resourceLoader;

    @RequestMapping({ "", "/" })
    public String product(Model model, HttpSession session) throws SQLException {
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

    @RequestMapping("/api")
    public ResponseEntity<?> productApi() throws SQLException {
        return ResponseEntity.ok(productService.getAll());
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
            System.out.println(visible);
            if (user.getRole().getRole_name().equals("ADMIN")) {
                List<ImagesProductRequest> images = new ArrayList<>();
                String path =  "src/main/resources/static/uploads/images/products";
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
                model.addAttribute("product", product);
                return "pages/dashboard/product/update";
            } else if (user.getRole().getRole_name().equals("CUSTOMER")) {
                return "redirect:/";
            }
        }
        return "pages/dashboard/product/update";
    }

    /*
     * @PostMapping("/update")
     * public String update(@RequestParam Integer productID, ProductRequest
     * productRequest, Model model,
     * HttpSession session, @RequestParam("images") List<MultipartFile> files)
     * throws SQLException {
     * if (session.getAttribute("user") != null) {
     * Users user = (Users) session.getAttribute("user");
     * if (user.getRole().getRole_name().equals("ADMIN")) {
     * 
     * String uploadDir = "src/main/resources/static/images/product";
     * File dir = new File(uploadDir);
     * if (!dir.exists()) {
     * dir.mkdirs();
     * }
     * 
     * List<ImagesProductRequest> images = productRequest.getImages();
     * for (MultipartFile file : files) {
     * String fileName = StringUtils.cleanPath(file.getOriginalFilename());
     * try {
     * ImagesProductRequest image = new ImagesProductRequest();
     * image.setImage(fileName);
     * images.add(image);
     * String filePath = uploadDir + "/" + fileName;
     * File dest = new File(filePath);
     * file.transferTo(dest);
     * } catch (Exception e) {
     * e.printStackTrace();
     * }
     * }
     * productRequest.setImages(images);
     * productService.updateDataById(productID, productRequest);
     * 
     * return "pages/dashboard/product/update";
     * } else if (user.getRole().getRole_name().equals("CUSTOMER")) {
     * return "redirect:/";
     * }
     * }
     * return "pages/dashboard/product/update";
     * }
     * 
     * @RequestMapping("/delete")
     * public String delete(@RequestParam Integer productID, Model model,
     * HttpSession session) throws SQLException {
     * model.addAttribute("title", "Delete Product");
     * if (session.getAttribute("user") != null) {
     * Users user = (Users) session.getAttribute("user");
     * if (user.getRole().getRole_name().equals("ADMIN")) {
     * productService.hideProduct(productID);
     * return "redirect:/dashboard/products/";
     * } else if (user.getRole().getRole_name().equals("CUSTOMER")) {
     * return "redirect:/";
     * }
     * }
     * return "redirect:/dashboard/products/";
     * }
     */
}
