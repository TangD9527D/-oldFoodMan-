package com.oldFoodMan.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.oldFoodMan.demo.model.Member;

@Controller
public class PageController {

	@GetMapping("/newAccount")
	public ModelAndView newAccount(ModelAndView mav) {

		mav.setViewName("member/newMember");

		Member mb = new Member();

		mav.getModel().put("member", mb);

		return mav;
	}

	
	@GetMapping("/forgotMail")
	public String forgotMail() {
		return "forgotMail";
	}
	
	@GetMapping("/frame")
	public String frame() {
		return "frame";
	}
	
	@GetMapping("/frame2")
	public String frame2() {
		return "frame2";
	}
	
	@GetMapping("/backStage/account")
	public String index() {
		return "backStage/account";
	}
	
	
}
