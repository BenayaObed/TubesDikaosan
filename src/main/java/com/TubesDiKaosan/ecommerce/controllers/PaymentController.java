package com.TubesDiKaosan.ecommerce.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.TubesDiKaosan.ecommerce.services.CategoryServiceImplement;

import org.springframework.ui.Model;

@SpringBootApplication
@Controller
public class PaymentController {
  @Autowired
  private CategoryServiceImplement category;

  @RequestMapping({ "/payment" })
  public String paymentPage(Model model) {
    model.addAttribute("title", "Payment");
    return "pages/fe/payment";
  }
}
