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

import jakarta.servlet.http.HttpSession;

@Controller
public class OrdersController {
    @Autowired
    private List<UsersService> usersServices;

    @RequestMapping("/dashboard/orders")
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

    @RequestMapping("/dashboard/orders/detail")
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

    // update status order
    @RequestMapping("/dashboard/orders/detail_update")
    public String updateStatusOrder(@RequestParam Integer OrderID, @RequestParam String status, Model model,
            HttpSession session,
            @RequestParam String userID)
            throws SQLException {
        if (session.getAttribute("user") != null) {
            Users user = (Users) session.getAttribute("user");
            for (UsersService userService : usersServices) {
                if (userService instanceof AdminService && user.getRole().getRole_name().equals("ADMIN")) {
                    Response response = ((AdminService) userService).updateStatusOrder(OrderID, status);
                    if (response.getStatus() == 200)
                        model.addAttribute("alert", "success");
                    else
                        model.addAttribute("alert", "failed");
                    
                    return "redirect:/dashboard/orders/detail?OrderID=" + OrderID + "&userID=" + userID;
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
