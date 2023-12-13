package com.TubesDiKaosan.ecommerce.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.TubesDiKaosan.ecommerce.services.CategoryServiceImplement;

import org.springframework.ui.Model;

@SpringBootApplication
@Controller
public class CheckoutController {
  @Autowired
  private CategoryServiceImplement category;

  @RequestMapping({ "/checkout" })
  public String checkoutPage(Model model) {
    model.addAttribute("title", "Checkout");
    return "pages/fe/checkout";
  }
}
