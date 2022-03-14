package com.oldFoodMan.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.oldFoodMan.demo.model.Member;
import com.oldFoodMan.demo.service.MemberServiceImpl;

@Controller
public class BackStageController {
	
	@Autowired
	private MemberServiceImpl mbService;

	@ResponseBody
	@PostMapping("/backStage/login")
	public String login(@RequestBody Member mb) {
		
		String account = mb.getAccount();
		
		Member testmb = mbService.findByAccount(account);
		System.out.println(testmb);
		
		if(testmb != null) {
			
			System.out.println("11111");
			return "flag1";

		}else {
			
			System.out.println("22222");
			return "flag2";
		}
	}

}
