package com.oldFoodMan.demo.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.oldFoodMan.demo.model.Member;
import com.oldFoodMan.demo.service.MemberServiceImpl;
import com.oldFoodMan.demo.utils.EncrytedPasswordUtils;

@Controller
public class MemberController {

	@Autowired
	private MemberServiceImpl service;

	@PostMapping("/newMember")
	public ModelAndView newMember(ModelAndView mav, @Valid @ModelAttribute Member member, BindingResult rs) {

		if (!rs.hasErrors()) {
			String memberPwd = member.getMemberPwd();

			String pwd = EncrytedPasswordUtils.encrytePassword(memberPwd);

			member.setMemberPwd(pwd);

			service.insert(member);

			mav.getModel().put("member", member);
		}

		mav.setViewName("welcomePage");

		return mav;
	}

	@GetMapping("/editMember")
	public ModelAndView editMember(ModelAndView mav, @RequestParam(value = "id") Integer id) {

		Member mb = service.findById(id);

		mav.getModel().put("member", mb);
		mav.setViewName("member/editMember");

		return mav;
	}

	@PostMapping("/editMember")
	public ModelAndView viewMember(ModelAndView mav, @Valid @ModelAttribute(name = "member") Member mb) {

		mav.setViewName("member/editMember");

		String memberPwd = mb.getMemberPwd();

		String pwd = EncrytedPasswordUtils.encrytePassword(memberPwd);

		mb.setMemberPwd(pwd);

		service.update(mb);

		mav.setViewName("redirect:/viewMember");

		return mav;
	}
}
