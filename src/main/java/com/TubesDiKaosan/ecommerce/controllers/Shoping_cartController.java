package com.TubesDiKaosan.ecommerce.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.TubesDiKaosan.ecommerce.services.CategoryServiceImplement;

import org.springframework.ui.Model;

@SpringBootApplication
@Controller
public class Shoping_cartController {
  @Autowired
  private CategoryServiceImplement category;

  @RequestMapping({ "/shoping_cart" })
  public String shoping_cartPage(Model model) {
    model.addAttribute("title", "Shoping_cart");
    return "pages/fe/shoping_cart";
  }
}
