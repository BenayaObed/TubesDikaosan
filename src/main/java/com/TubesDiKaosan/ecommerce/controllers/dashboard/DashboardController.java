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
import com.TubesDiKaosan.ecommerce.services.ActorServices.AdminService;
import com.TubesDiKaosan.ecommerce.services.ActorServices.UsersService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/dashboard")
public class DashboardController {

    @Autowired
    private List<UsersService> usersServices;

    @RequestMapping({"", "/", "/index"})
    public String dashboard(Model model, HttpSession session) throws SQLException {
        model.addAttribute("title", "Dashboard");
        for (UsersService userService : usersServices) {
            if (userService instanceof AdminService && session.getAttribute("user") != null) {
                Users user = (Users) session.getAttribute("user");
                if (user.getRole().getRole_name().equals("ADMIN")) {
                    // ger report
                    List<Object[]> reportOrderStatus = (List<Object[]>) ((AdminService) userService).getReportOrderStatus().getData();
                    List<Object[]> reportOrderProduct = (List<Object[]>) ((AdminService) userService).getReportProductDelivered().getData();
                    List<Orders[]> reportOrderPayment = (List<Orders[]>) ((AdminService) userService).getPaymentReportByMonth().getData();
                    
                    model.addAttribute("reportOrderStatus", reportOrderStatus);
                    model.addAttribute("reportOrderProduct", reportOrderProduct);
                    model.addAttribute("reportOrderPayment", reportOrderPayment);
                    return "pages/dashboard/index";
                } 
            }
        }
        return "redirect:/";
    }

}
