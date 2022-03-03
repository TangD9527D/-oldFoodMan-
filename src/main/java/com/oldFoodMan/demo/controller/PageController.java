package com.oldFoodMan.demo.controller;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.oldFoodMan.demo.model.Member;

@Controller
public class PageController {

	@GetMapping("/userPage/{user}")
	public ModelAndView userPage(ModelAndView mav) {
		
		mav.setViewName("lemon/reviewerMainPage");

		Member mb = new Member();

		mav.getModel().put("member", mb);

		return mav;
	}

	@GetMapping("/newAccount")
	public ModelAndView newAccount(ModelAndView mav) {

		mav.setViewName("member/newMember");

		Member mb = new Member();

		mav.getModel().put("member", mb);

		return mav;
	}
	
	@GetMapping("/viewMember")
	public ModelAndView viewMember(ModelAndView mav ,@Valid @ModelAttribute Member member, BindingResult rs) {
		
		mav.setViewName("member/vieMember");
		
		mav.getModel().put("member", member);
		
		return mav;
	}
}
