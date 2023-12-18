package com.TubesDiKaosan.ecommerce.controllers.dashboard;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.TubesDiKaosan.ecommerce.models.CustomerAddress;
import com.TubesDiKaosan.ecommerce.models.Orders;
import com.TubesDiKaosan.ecommerce.models.OrdersItem;
import com.TubesDiKaosan.ecommerce.models.Users;
import com.TubesDiKaosan.ecommerce.payloads.response.Response;
import com.TubesDiKaosan.ecommerce.services.ActorServices.AdminService;
import com.TubesDiKaosan.ecommerce.services.ActorServices.UsersService;
import com.TubesDiKaosan.ecommerce.services.ShoppingServices.ShoppingServices;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/dashboard")
public class DashboardController {
    @Autowired
    private List<UsersService> usersServices;

    @RequestMapping({ "", "/", "/index" })
    public String dashboard(Model model, HttpSession session) throws SQLException {
        model.addAttribute("title", "Dashboard");
        // check session admin or not
        if (session.getAttribute("user") != null) {
            Users user = (Users) session.getAttribute("user");
            if (user.getRole().getRole_name().equals("ADMIN")) {
                return "pages/dashboard/index";
            } else if (user.getRole().getRole_name().equals("CUSTOMER")) {
                return "redirect:/";
            }
        }
        return "redirect:/login";
    }

    @RequestMapping("/orders")
    public String ordersPage(Model model, HttpSession session) throws SQLException {
        model.addAttribute("title", "Orders");
        if (session.getAttribute("user") != null) {
            Users user = (Users) session.getAttribute("user");
            for (UsersService userService : usersServices) {
                if (userService instanceof AdminService && user.getRole().getRole_name().equals("ADMIN")) {
                    List<Orders> data = (List<Orders>) ((AdminService) userService).getAllOrders().getData();
                    model.addAttribute("data", data);
                    return "pages/dashboard/orders";
                }
            }
        }
        return "redirect:/";
    }

    @RequestMapping("/orders/detail")
    public String ordersDetailPage(@RequestParam Integer OrderID, Model model, HttpSession session,
            @RequestParam String userID)
            throws SQLException {
        model.addAttribute("title", "Orders Detail");
        if (session.getAttribute("user") != null) {
            Users user = (Users) session.getAttribute("user");
            for (UsersService userService : usersServices) {
                if (userService instanceof AdminService && user.getRole().getRole_name().equals("ADMIN")) {
                    List<OrdersItem> data = (List<OrdersItem>) ((AdminService) userService).getOrderDetail(OrderID)
                            .getData();
                    CustomerAddress address = (CustomerAddress) ((AdminService) userService)
                            .getAddressCustomer(userID).getData();
                    model.addAttribute("customer_address", address);
                    model.addAttribute("data", data);
                    return "pages/dashboard/order_details";
                }
            }
        }
        return "redirect:/";
    }

    @RequestMapping("/test/detail")
    public ResponseEntity<?> testDetailPage(@RequestParam Integer OrderID, Model model, HttpSession session,
            @RequestParam String userID)
            throws SQLException {
        for (UsersService userService : usersServices) {
            if (userService instanceof AdminService) {
                List<OrdersItem> data = (List<OrdersItem>) ((AdminService) userService).getOrderDetail(OrderID)
                        .getData();
                CustomerAddress address = (CustomerAddress) ((AdminService) userService)
                        .getAddressCustomer(userID).getData();
                model.addAttribute("customer_address", address);
                model.addAttribute("data", data);
                return ResponseEntity.ok(address);
            }
        }
        return ResponseEntity.ok("ERROR");
    }

}
