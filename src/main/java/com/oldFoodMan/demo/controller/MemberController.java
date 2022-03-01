package com.oldFoodMan.demo.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.oldFoodMan.demo.dto.MemberDto;
import com.oldFoodMan.demo.model.Member;
import com.oldFoodMan.demo.service.MemberServiceImpl;
import com.oldFoodMan.demo.utils.EncrytedPasswordUtils;

@Controller
public class MemberController {

	@Autowired
	private MemberServiceImpl service;
	
	@PostMapping("/newAccount")
	public ModelAndView newMember(ModelAndView mav,@Valid @ModelAttribute MemberDto memberDto, BindingResult rs) {
		
		if(!rs.hasErrors()) {
			
			String memberName = memberDto.getMemberName();
			String memberaccount = memberDto.getAccount();
			String memberPwd = memberDto.getMemberPwd();
			
			String pwd = EncrytedPasswordUtils.encrytePassword(memberPwd);
			
			Member mb = new Member();
			mb.setMemberName(memberName);
			mb.setAccount(memberaccount);
			mb.setMemberPwd(pwd);
			
			service.insert(mb);
			
			mav.getModel().put("member", mb);
		}
		
		mav.setViewName("redierct:/");
		
		return mav;
	}
}
