package com.oldFoodMan.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.oldFoodMan.demo.service.OrderFormService;

@Controller
public class OrderFormController {
	
	@Autowired
	private OrderFormService service;
}
