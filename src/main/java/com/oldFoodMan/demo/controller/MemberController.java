package com.oldFoodMan.demo.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.oldFoodMan.demo.model.Member;
import com.oldFoodMan.demo.service.MemberServiceImpl;

@Controller
public class MemberController {

	@Autowired
	private MemberServiceImpl service;
	
	@PostMapping("/newMember")
	public ModelAndView newMember(ModelAndView mav,@Valid @ModelAttribute Member member, BindingResult rs) {
		
		if(!rs.hasErrors()) {
			service.insert(member);
			Member newMember = new Member();
			mav.getModel().put("member", newMember);
		}
		
		mav.setViewName("member/newMember");
		
		return mav;
	}
}
