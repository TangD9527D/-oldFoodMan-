package com.oldFoodMan.demo.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.oldFoodMan.demo.model.Member;
import com.oldFoodMan.demo.service.MemberServiceImpl;

@Controller
public class PageController {
	
	@Autowired
	private MemberServiceImpl service;

	@GetMapping("/newAccount")
	public ModelAndView newAccount(ModelAndView mav) {

		mav.setViewName("member/newMember");

		Member mb = new Member();

		mav.getModel().put("member", mb);

		return mav;
	}

	@GetMapping("/viewMember")
	public ModelAndView viewMember(ModelAndView mav, HttpSession hs, BindingResult rs) {

		Member mb = (Member) hs.getAttribute("member");
		
		Member mbr = service.findById(mb.getId()) ;
		
		mav.setViewName("member/viewMember");

		mav.getModel().put("member", mbr);

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
