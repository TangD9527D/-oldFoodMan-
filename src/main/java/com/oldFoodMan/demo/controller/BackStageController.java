package com.oldFoodMan.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oldFoodMan.demo.model.Member;
import com.oldFoodMan.demo.service.MemberServiceImpl;
import com.oldFoodMan.demo.utils.EncrytedPasswordUtils;

@Controller
public class BackStageController {

	@Autowired
	private MemberServiceImpl mbService;

	@ResponseBody
	@PostMapping("/backStage/login")
	public int login(@RequestBody Member mb) {

		String account = mb.getAccount();
		String loginPwd = mb.getMemberPwd();
		System.out.println("loginPwd: " + loginPwd);
		Member testmb = mbService.findByAccount(account);

		if (testmb != null) {

			String mbrPwd = testmb.getMemberPwd();
			
			if (loginPwd.equals(mbrPwd)) {
				System.out.println("11111");
				return 1;}
			else {
				System.out.println("000000");
				return 0;
			}
		} else {

			System.out.println("22222");
			return 0;
		}
	}
	
	@ResponseBody
	@PostMapping("/backStage/mbrDelete/{id}")
	public String deleteMember(@PathVariable(name = "id") int mbrId) {
		
		mbService.delete(mbrId);
		
		return "success";
	}
	
	@ResponseBody
	@PostMapping("/backStage/countCity")
	public List<String> countCity() {
		
		List<String> city = mbService.countCity();
		System.out.println(city);
		 
		return city;
		
	}
	
	@ResponseBody
	@PostMapping("/backStage/countYrMth")
	public List<String> countYrMth() {
		
		List<String> yrMth = mbService.countYrMth();
		System.out.println(yrMth);
		 
		return yrMth;
		
	}

}
