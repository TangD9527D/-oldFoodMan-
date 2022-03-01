package com.oldFoodMan.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.oldFoodMan.demo.model.Member;

@Controller
public class PageController {
	
	@GetMapping("/123")
	public String home() {
		return "index";
	}
	
	@GetMapping("/newAccount")
	public ModelAndView newAccount(ModelAndView mav) {
		
		mav.setViewName("member/newMember");
		
		Member mb = new Member();
		
		mav.getModel().put("member", mb);
		
		return mav;
	}
}
