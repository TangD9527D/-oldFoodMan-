package com.oldFoodMan.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.oldFoodMan.demo.model.Member;
import com.oldFoodMan.demo.service.MailService;
import com.oldFoodMan.demo.service.MemberServiceImpl;
import com.oldFoodMan.demo.utils.EncrytedPasswordUtils;

@Controller
public class MailController {
	
	@Autowired
	MailService mailService;
	
	@Autowired
	MemberServiceImpl memberService;
	
	@ResponseBody
	@PostMapping("/mail/{email}")
	public String sendMail(@PathVariable(name = "email") String email) {
		
		Member mb = memberService.findByAccount(email);
		Integer id = mb.getId();
		
		mailService.prepareAndSend(email, id);
		
		return "如果您有客戶帳戶，系統會向您發送一封電子郵件以創建新密碼。";
	}
	
	
	@GetMapping("/resetPassword/{id}")
	public ModelAndView getMember(ModelAndView mav, @PathVariable(name = "id") Integer id) {
		
		Member mb = memberService.findById(id);
		
		mb.setMemberPwd("");
		
		mav.getModel().put("member", mb);
		
		mav.setViewName("member/resetPwd");
		
		return mav;
	}
	
	@PostMapping("/resetPassword")
	public ModelAndView resetPassword(ModelAndView mav,@ModelAttribute(name = "member") Member mb) {
		
		String memberPwd = mb.getMemberPwd();

		String pwd = EncrytedPasswordUtils.encrytePassword(memberPwd);

		mb.setMemberPwd(pwd);
		
		memberService.update(mb);
		
		mav.setViewName("redirect:/");
		
		return mav;
	}
	
	
}
