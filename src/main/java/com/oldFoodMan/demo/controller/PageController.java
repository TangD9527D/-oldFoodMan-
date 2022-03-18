package com.oldFoodMan.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.oldFoodMan.demo.model.Member;

@Controller
public class PageController {
	
	@GetMapping("/forgotMail")
	public String forgotMail() {
		return "forgotMail";
	}
	
	@GetMapping("/backStage/accountAnalysis")
	public String accountAnalysis() {
		return "backStage/accountAnalysis";
	}
	
}
