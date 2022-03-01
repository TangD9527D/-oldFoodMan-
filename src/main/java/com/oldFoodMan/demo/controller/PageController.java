package com.oldFoodMan.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PageController {
	
	@GetMapping("/123")
	public String home() {
		return "index";
	}
	
	@GetMapping("/newAccount")
	public String newAccount() {
		return "member/newMember";
	}
}
