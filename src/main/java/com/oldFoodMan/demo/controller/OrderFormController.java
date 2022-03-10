package com.oldFoodMan.demo.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.oldFoodMan.demo.model.Product;
import com.oldFoodMan.demo.service.OrderFormService;

@Controller
public class OrderFormController {
	
	private OrderFormService service;
	
	@GetMapping("/myOrder")
	public String orderPage(Model model) {
		return "myOrderPage";
	}
	
}
