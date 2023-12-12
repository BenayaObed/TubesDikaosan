package com.TubesDiKaosan.ecommerce.controllers;

import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.ui.Model;

@SpringBootApplication
@Controller
public class DescriptionController {
  @RequestMapping({ "/description" })
  public String descriptionPage(Model model) {
    model.addAttribute("title", "Description");
    return "pages/fe/description";
  }
}
