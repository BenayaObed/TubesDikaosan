package com.TubesDiKaosan.ecommerce.controllers.dashboard;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.TubesDiKaosan.ecommerce.models.Payment;
import com.TubesDiKaosan.ecommerce.models.PaymentMethod;
import com.TubesDiKaosan.ecommerce.models.Users;
import com.TubesDiKaosan.ecommerce.payloads.requests.PaymentMethodRequest;
import com.TubesDiKaosan.ecommerce.payloads.response.Response;
import com.TubesDiKaosan.ecommerce.services.PaymentServices.PaymentMethodService;
import jakarta.servlet.http.HttpSession;

import java.sql.SQLException;
import java.util.List;

@Controller
@RequestMapping("/dashboard/payment-method")
public class PaymentMethodController {
    @Autowired
    private PaymentMethodService paymentMethodService;


    @RequestMapping({"", "/"})
    public String index(Model model, HttpSession session) throws SQLException {
        if (session.getAttribute("user") != null) {
            model.addAttribute("title", "Payment Method");
            Users user = (Users) session.getAttribute("user");
            if (user.getRole().getRole_name().equals("ADMIN")) {
                List<PaymentMethod> paymentMethods = (List<PaymentMethod>) paymentMethodService.getAll().getData();
                model.addAttribute("data", paymentMethods);
                return "pages/dashboard/paymentMethod";
            }
        }
        return "redirect:/";
    }

    @RequestMapping("/create")
    public String create(Model model, HttpSession session) throws SQLException {
        model.addAttribute("title", "Create Payment Method");
        if (session.getAttribute("user") != null) {
            Users user = (Users) session.getAttribute("user");
            if (user.getRole().getRole_name().equals("ADMIN")) {
                List<PaymentMethod> paymentMethods = (List<PaymentMethod>) paymentMethodService.getAll().getData();
                model.addAttribute("data", paymentMethods);
                return "pages/dashboard/paymentMethod_add";
            }
        }
        return "redirect:/";
    }

    @PostMapping("/save")
    public String save(PaymentMethodRequest paymentMethod, HttpSession session) throws SQLException {
        if (session.getAttribute("user") != null) {
            Users user = (Users) session.getAttribute("user");
            if (user.getRole().getRole_name().equals("ADMIN")) {
                paymentMethodService.createData(paymentMethod);
                return "redirect:/dashboard/payment-method";
            }
        }
        return "redirect:/";
    }

    @RequestMapping("/edit")
    public String edit(Model model, @RequestParam Integer methodID, PaymentMethodRequest request, HttpSession session) throws SQLException{
        model.addAttribute("title", "Edit Payment Method");
        if (session.getAttribute("user") != null) {
            Users user = (Users) session.getAttribute("user");
            if (user.getRole().getRole_name().equals("ADMIN")) {
                PaymentMethod paymentMethod = (PaymentMethod) paymentMethodService.findDataByID(methodID).getData();
                model.addAttribute("data", paymentMethod);
                return "pages/dashboard/paymentMethod_edit";
            }
        }
        return "redirect:/";
    }

    @PostMapping("/update")
    public String update(Model model,@RequestParam Integer methodID,PaymentMethodRequest paymentMethod, HttpSession session) throws SQLException{
        if (session.getAttribute("user") != null) {
            Users user = (Users) session.getAttribute("user");
            if (user.getRole().getRole_name().equals("ADMIN")) {
                PaymentMethod method = (PaymentMethod) paymentMethodService.updateDataById(methodID, paymentMethod).getData();
                return "redirect:/dashboard/payment-method/edit?methodID="+methodID;
            }
        }
        return "redirect:/";
    }

    @RequestMapping("/delete")
    public String delete(Model model,@RequestParam Integer methodID, HttpSession session) throws SQLException{
        if (session.getAttribute("user") != null) {
            Users user = (Users) session.getAttribute("user");
            if (user.getRole().getRole_name().equals("ADMIN")) {
                paymentMethodService.deleteDataByID(methodID);
                return "redirect:/dashboard/payment-method";
            }
        }
        return "redirect:/";
    }
}
