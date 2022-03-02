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
import com.oldFoodMan.demo.utils.EncrytedPasswordUtils;

@Controller
public class MemberController {

	@Autowired
	private MemberServiceImpl service;
		
	@PostMapping("/newMember")
	public ModelAndView newMember(ModelAndView mav,@Valid @ModelAttribute Member member, BindingResult rs) {
		System.out.println("123");
		if(!rs.hasErrors()) {
			
//			String memberName = memberDto.getMemberName();
//			String memberaccount = memberDto.getAccount();
//			String memberPwd = memberDto.getMemberPwd();
//			
//			String pwd = EncrytedPasswordUtils.encrytePassword(memberPwd);
//			
//			Member mb = new Member();
//			mb.setMemberName(memberName);
//			mb.setAccount(memberaccount);
//			mb.setMemberPwd(pwd);
			
			String memberPwd = member.getMemberPwd();
			
			System.out.println("456");
			
			String pwd = EncrytedPasswordUtils.encrytePassword(memberPwd);
			
			member.setMemberPwd(pwd);

			
			service.insert(member);
			
			mav.getModel().put("member", member);
		}
		
		mav.setViewName("welcomePage");
		
		return mav;
	}
}
