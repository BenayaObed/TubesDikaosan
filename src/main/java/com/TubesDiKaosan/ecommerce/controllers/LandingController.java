package com.TubesDiKaosan.ecommerce.controllers;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.sql.SQLException;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.kafka.KafkaProperties.Admin;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.TubesDiKaosan.ecommerce.models.Category;
import com.TubesDiKaosan.ecommerce.models.Orders;
import com.TubesDiKaosan.ecommerce.models.OrdersItem;
import com.TubesDiKaosan.ecommerce.models.Payment;
import com.TubesDiKaosan.ecommerce.models.PaymentMethod;
import com.TubesDiKaosan.ecommerce.models.Product;
import com.TubesDiKaosan.ecommerce.models.Riviews;
import com.TubesDiKaosan.ecommerce.models.Stock;
import com.TubesDiKaosan.ecommerce.models.Users;
import com.TubesDiKaosan.ecommerce.payloads.AnotherClass.ShopPageData;
import com.TubesDiKaosan.ecommerce.payloads.requests.RiviewRequest;
import com.TubesDiKaosan.ecommerce.payloads.response.Response;
import com.TubesDiKaosan.ecommerce.services.ActorServices.AdminService;
import com.TubesDiKaosan.ecommerce.services.ActorServices.CustomerService;
import com.TubesDiKaosan.ecommerce.services.ActorServices.UsersService;
import com.TubesDiKaosan.ecommerce.services.PaymentServices.PaymentMethodService;
import com.TubesDiKaosan.ecommerce.services.ProductServices.CategoryService;
import com.TubesDiKaosan.ecommerce.services.ProductServices.ProductService;
import com.TubesDiKaosan.ecommerce.services.ProductServices.RiviewServices;
import com.TubesDiKaosan.ecommerce.services.ShoppingServices.ShoppingServices;

import jakarta.servlet.http.HttpSession;

@Controller
public class LandingController {
    @Autowired
    private List<UsersService> usersServices;

    @Autowired
    private ProductService productService;

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private ShoppingServices ShoppingServices;

    @Autowired
    private PaymentMethodService PaymentMethodService;

    @Autowired
    private RiviewServices riviewServices;

    @Autowired
    private RiviewServices riviewService;

    @RequestMapping({ "/", "/home" })
    public String index(Model model, HttpSession session) throws SQLException {
        model.addAttribute("title", "Home");
        for (UsersService userService : usersServices) {
            if (userService instanceof UsersService) {
                List<Product> products = (List<Product>) productService.getAll().getData();
                model.addAttribute("products", products);
                Users user = (Users) session.getAttribute("user");
                if (user != null){
                    List<Orders> history = (List<Orders>) ShoppingServices.getAllOrdersByUsers(user.getUser_id()).getData();
                    session.setAttribute("history", history);
                    // model.addAttribute("history", history);
                        }
                return "pages/fe/homepage";
            }
        }
        return "pages/fe/homepage";
    }

    

    // @RequestMapping("/shop")
    // public String shop(@RequestParam(required = false) String category,
    // @RequestParam(required = false) String keyword,
    // Model model, HttpSession session) throws SQLException {
    // List<Product> products = (List<Product>) productService.getAll().getData();
    // List<Riviews> riviews = (List<Riviews>) riviewServices.getAll().getData();

    // // Calculate mean ratings
    // Map<Integer, Float> mean = new HashMap<>();
    // Map<Integer, Integer> count = new HashMap<>();

    // for (Riviews riview : riviews) {
    // int productId = riview.getProduct().getProduct_id();
    // float rate = riview.getRate();

    // mean.merge(productId, rate, Float::sum);
    // count.merge(productId, 1, Integer::sum);
    // }

    // mean.replaceAll((productId, total) -> total / count.get(productId));

    // // Query for categories
    // List<String> categories = (List<String>) categoryService.getAll().getData();

    // if (category != null) {
    // // Filter products by category
    // products = products.stream()
    // .filter(product -> {
    // Category productCategory = product.getCategory();
    // return productCategory != null &&
    // productCategory.getCategory_name().equalsIgnoreCase(category);
    // }).collect(Collectors.toList());

    // mean.keySet().retainAll(products.stream().map(Product::getProduct_id).collect(Collectors.toSet()));
    // }

    // // Query for best sellers
    // List<Product> bestSellers = (List<Product>)
    // productService.getBestSeller().getData();
    // ShopPageData shopPageData = new ShopPageData("Shop", products, mean,
    // categories, bestSellers);
    // model.addAttribute("shopPageData", shopPageData);

    // return "pages/fe/shop";
    // }

    @RequestMapping("/shop")
    public String shop(@RequestParam(required = false) String category,
            @RequestParam(required = false) String search,
            Model model, HttpSession session) throws SQLException {
        List<Product> products;

        // Search products by search
        if (search != null && !search.isEmpty()) {
            Response searchResponse = productService.searchProduct(search);
            if (searchResponse.getStatus() == HttpStatus.OK.value()) {
                products = (List<Product>) searchResponse.getData();
            } else {
                // Handle the case when no products are found
                model.addAttribute("errorMessage", "No products found for the given keyword.");
                return "pages/fe/shop";
            }
        } else {
            // If no search is provided, retrieve all products
            products = (List<Product>) productService.getAll().getData();
        }

        List<Riviews> reviews = (List<Riviews>) riviewServices.getAll().getData();

        // Calculate mean ratings
        Map<Integer, Float> mean = new HashMap<>();
        Map<Integer, Integer> count = new HashMap<>();

        for (Riviews review : reviews) {
            int productId = review.getProduct().getProduct_id();
            float rate = review.getRate();

            mean.merge(productId, rate, Float::sum);
            count.merge(productId, 1, Integer::sum);
        }

        mean.replaceAll((productId, total) -> total / count.get(productId));

        // Filter products by category
        if (category != null) {
            products = products.stream()
                    .filter(product -> {
                        Category productCategory = product.getCategory();
                        return productCategory != null && productCategory.getCategory_name().equalsIgnoreCase(category);
                    }).collect(Collectors.toList());

            mean.keySet().retainAll(products.stream().map(Product::getProduct_id).collect(Collectors.toSet()));
        }

        // Query for categories
        List<String> categories = (List<String>) categoryService.getAll().getData();

        // Query for best sellers
        List<Product> bestSellers = (List<Product>) productService.getBestSeller().getData();

        ShopPageData shopPageData = new ShopPageData("Shop", products, mean, categories, bestSellers);
        model.addAttribute("shopPageData", shopPageData);

        return "pages/fe/shop";
    }

    @RequestMapping("/contact")
    public String contact(Model model, HttpSession session) throws SQLException {
        model.addAttribute("title", "Contact");
        for (UsersService userService : usersServices) {
            if (userService instanceof UsersService) {
                return "pages/fe/contact";
            }
        }
        return "pages/fe/about";
    }

    @RequestMapping("/description")
    public String deskription(@RequestParam Integer product, Model model, HttpSession session) throws SQLException {
        model.addAttribute("title", "Description");
        Product data_product = (Product) productService.findDataByID(product).getData();
        Map<String, Object> data = new HashMap<>();

        for (Stock stock : data_product.getStock()) {
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

        List<Riviews> riviews = (List<Riviews>) riviewServices.riviewsByProduct(product).getData();
        if (riviews != null) {
            Float mean = 0f;
            for (Riviews riview : riviews)
                mean += riview.getRate();
            model.addAttribute("total_rating", mean / riviews.size());
            model.addAttribute("riviews", riviews);
            model.addAttribute("total_riviews", riviews.size());
        }

        model.addAttribute("data_stock", data);
        model.addAttribute("data", data_product);

        if (session.getAttribute("user") != null) {
            Users user = (Users) session.getAttribute("user");
            Response item = ShoppingServices.getItemDelivered(user.getUser_id(), product);
            if (item.getStatus() == 200) {
                System.out.println(">>>>>>>>>>>> 1");
                model.addAttribute("feedback", true);
            } else {
                System.out.println(">>>>>>>>>>>> 0");
                model.addAttribute("feedback", false);
            }
        }

        return "pages/fe/description";
    }

    @RequestMapping("/checkout")
    public String checkout(Model model, HttpSession session) throws SQLException {
        model.addAttribute("title", "Checkout");
        if (session.getAttribute("user") != null) {
            Users user = (Users) session.getAttribute("user");
            Orders orders = (Orders) ShoppingServices.getOrderByStatusAndUserID("checkout", user.getUser_id())
                    .getData();
            if (orders != null) {
                if (orders.getPayment_id() != null) {
                    Payment payment = (Payment) ShoppingServices.getPayment(orders.getOrder_id()).getData();
                    if (payment.getPayment_status().equals("process-payment")) {
                        if (payment.getPayment_method().getPayment_method_name().equals("COD")) {
                            return "redirect:/payment?bank=" + payment.getPayment_id() + "&total="
                                    + payment.getPayment_total();
                        } else
                            return "redirect:/payment?method=" + payment.getPayment_method().getPayment_method_name()
                                    + "&bank="
                                    + payment.getPayment_id() + "&total=" + payment.getPayment_total();
                    }
                }
                List<OrdersItem> ordersItems = (List<OrdersItem>) ShoppingServices
                        .getAllOrdersItem(orders.getOrder_id(), user.getUser_id()).getData();
                List<PaymentMethod> paymentMethods = (List<PaymentMethod>) PaymentMethodService.getAll().getData();
                model.addAttribute("data_cart", ordersItems);
                model.addAttribute("order_id", orders.getOrder_id());
                model.addAttribute("paymentMethods", paymentMethods);
                Integer total = 0;
                for (OrdersItem ordersItem : ordersItems) {
                    total += ordersItem.getTotal_price();
                }
                model.addAttribute("total", total);
                return "pages/fe/checkout";
            }
            return "redirect:/shoping_cart";
        }
        return "redirect:/";
    }

    @RequestMapping("/shoping_cart")
    public String shoping_cart(Model model, RedirectAttributes redirectAttributes, HttpSession session)
            throws SQLException {
        model.addAttribute("title", "Shoping_Cart");
        if (session.getAttribute("user") != null) {
            Users user = (Users) session.getAttribute("user");
            Orders orders = (Orders) ShoppingServices.getOrderByStatusAndUserID("draft", user.getUser_id())
                    .getData();
            if (orders != null) {
                List<OrdersItem> ordersItems = (List<OrdersItem>) ShoppingServices
                        .getAllOrdersItem(orders.getOrder_id(), user.getUser_id()).getData();
                model.addAttribute("data_cart", ordersItems);
                model.addAttribute("order_id", orders.getOrder_id());
                return "pages/fe/shoping_cart";
            }
            orders = (Orders) ShoppingServices.getOrderByStatusAndUserID("checkout", user.getUser_id()).getData();
            if (orders != null) {
                return "redirect:/checkout";
            } else
                return "pages/fe/shoping_cart";
        }
        redirectAttributes.addFlashAttribute("alert", "Login dulu ya ^_^");
        return "redirect:/";
    }

    @RequestMapping("/payment")
    public String payment(@RequestParam(name = "method", required = false) String method,
            @RequestParam(name = "bank", required = false) Integer bank, @RequestParam Float total,
            Model model, HttpSession session, RedirectAttributes redirectAttributes) throws SQLException {
        model.addAttribute("title", "Payment");
        if (session.getAttribute("user") != null) {
            if (method == null) {
                redirectAttributes.addFlashAttribute("alert", "Pilih metode pembayaran");
                return "redirect:/checkout";
            }
            Users user = (Users) session.getAttribute("user");
            Orders orders = (Orders) ShoppingServices.getOrderByStatusAndUserID("checkout", user.getUser_id())
                    .getData();
            if (orders != null) {
                List<OrdersItem> ordersItems = (List<OrdersItem>) ShoppingServices
                        .getAllOrdersItem(orders.getOrder_id(), user.getUser_id()).getData();
                model.addAttribute("data_cart", ordersItems);
                model.addAttribute("order_id", orders.getOrder_id());
                model.addAttribute("total", total);
                System.out.println(">>>>" + method);
                System.out.println(">>>>" + bank);

                if (method.equals("on")) {
                    PaymentMethod paymentBANK = (PaymentMethod) PaymentMethodService.findDataByID(bank).getData();
                    System.out.println(">>>>" + paymentBANK.getPayment_method_name());
                    model.addAttribute("method", paymentBANK);
                }
                if (orders.getPayment_id() != null) {
                    Payment payment = (Payment) ShoppingServices.getPayment(orders.getOrder_id()).getData();
                    if (payment.getPayment_status().equals("process-payment")) {
                        return "pages/fe/payment";
                    }
                }
            }
            return "pages/fe/payment";
        }
        return "redirect:/";
    }

    @RequestMapping("/api/search")
    public ResponseEntity<?> api(@RequestParam String keyword, Model model) throws SQLException {
        List<Product> products = (List<Product>) productService.searchProduct(keyword).getData();
        return ResponseEntity.ok(products);
    }

    // payment ok
    @PostMapping("/payment_ok")
    public String payment_ok(@RequestParam Integer order_id,
            @RequestParam(name = "method", required = false) String method,
            @RequestParam(name = "bank", required = false) Integer bank, @RequestParam Float total, Model model,
            HttpSession session)
            throws SQLException {
        if (session.getAttribute("user") != null) {
            Users user = (Users) session.getAttribute("user");
            Orders orders = (Orders) ShoppingServices.getOrderByStatusAndUserID("checkout", user.getUser_id())
                    .getData();
            if (orders != null) {
                if (ShoppingServices.setPayment(orders.getOrder_id(), method, bank, total).getStatus() == 200) {
                    // Decrease Stock
                    List<OrdersItem> ordersItems = (List<OrdersItem>) ShoppingServices
                            .getAllOrdersItem(orders.getOrder_id(), user.getUser_id()).getData();
                    for (OrdersItem ordersItem : ordersItems) {
                        Product product = (Product) productService
                                .findDataByID(ordersItem.getProduct_id().getProduct_id()).getData();
                        for (Stock stock : product.getStock()) {
                            if (stock.getColor().equals(ordersItem.getColor())
                                    && stock.getSize().equals(ordersItem.getSize())) {
                                stock.setQuantity(stock.getQuantity() - ordersItem.getQuantity());
                                productService.updateStock(stock.getStock_id(), stock);
                            }
                        }
                    }
                    System.out.println("Set Payment");
                    if (method == null && bank == null) {
                        System.out.println("!!!!METHOD: " + method);
                        System.out.println("UNPAID KARENA COD");
                        if (ShoppingServices.updateStatusPayment(orders.getOrder_id(), "UNPAID").getStatus() == 200) {
                            if (ShoppingServices.updateStatusOrder(orders.getOrder_id(), "pending")
                                    .getStatus() == 200) {
                                return "redirect:/invoice?order_id=" + order_id;
                            }
                        }
                    } else {
                        System.out.println("!!!!METHOD: " + method);
                        System.out.println("PAID KARENA TF");
                        if (ShoppingServices.updateStatusPayment(orders.getOrder_id(), "PAID").getStatus() == 200) {
                            if (ShoppingServices.updateStatusOrder(orders.getOrder_id(), "pending")
                                    .getStatus() == 200) {
                                return "redirect:/invoice?order_id=" + order_id;
                            }
                        }
                    }
                }

            }
            return "return redirect:/shoping_cart";
        }
        return "redirect:/";
    }

    // Invoice
    @RequestMapping("/invoice")
    public String invoice(@RequestParam Integer order_id, Model model, HttpSession session) throws SQLException {
        model.addAttribute("title", "Invoice");
        if (session.getAttribute("user") != null) {
            Users user = (Users) session.getAttribute("user");
            // get orders by id but status not draft & checkout
            Orders orders = (Orders) ShoppingServices.getOrderWithoutDraftAndCheckout(order_id, user.getUser_id())
                    .getData();
            if (orders != null) {
                List<OrdersItem> data = (List<OrdersItem>) ShoppingServices
                        .getOrderDetail(orders.getOrder_id()).getData();
                model.addAttribute("data", data);
                return "pages/fe/invoice";
            }
            return "redirect:/";
        }
        return "redirect:/";
    }

    @PostMapping("/feedback")
    public String rate(RiviewRequest request, RedirectAttributes redirectAttributes, HttpSession session)
            throws SQLException {
        if (session.getAttribute("user") != null) {
            Users user = (Users) session.getAttribute("user");
            request.setUser(user.getUser_id());
            if (riviewService.createData(request).getStatus() == 200) {
                redirectAttributes.addFlashAttribute("alert", "Thank you for your feedback");
            } else {
                redirectAttributes.addFlashAttribute("alert", "Failed to give feedback");
            }
            return "redirect:/description?product=" + request.getProduct();
        }
        return "redirect:/";
    }
}
