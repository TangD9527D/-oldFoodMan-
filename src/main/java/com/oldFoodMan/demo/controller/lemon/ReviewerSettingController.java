package com.oldFoodMan.demo.controller.lemon;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.oldFoodMan.demo.model.Member;
import com.oldFoodMan.demo.model.lemon.ReviewerSetting;
import com.oldFoodMan.demo.model.lemon.ReviewerSettingRepository;
import com.oldFoodMan.demo.service.MemberServiceImpl;
import com.oldFoodMan.demo.service.lemon.ReviewerSettingService;

@Controller
public class ReviewerSettingController {
	
	@Autowired
	private ReviewerSettingRepository rsr;
	
	@Autowired
	private ReviewerSettingService service;
	
	@Autowired
	private MemberServiceImpl memberService;
	
	@GetMapping("/reviewerMainPage")
	public ModelAndView reviewerMainPage(ModelAndView mav,HttpSession hs) {
		Member memberData = (Member)hs.getAttribute("member");
		Integer memberId = memberData.getId();
		Member memberBean = memberService.findById(memberId);
		
		
		
//		mav.getModel().put("reviewerPage", reviewerBean);
		mav.getModel().put("memberPage", memberBean);
		mav.setViewName("/lemon/reviewerMainPage");
		return mav;
	}
	
	@GetMapping("/reviewerPageIntro")
	public ModelAndView reviewerPageIntro(ModelAndView mav,HttpSession hs) {
		Member memberData = (Member)hs.getAttribute("member");
		Integer memberId = memberData.getId();
		Member memberBean = memberService.findById(memberId);
		
		mav.getModel().put("memberPage", memberBean);
		mav.setViewName("/lemon/reviewerPageIntro");
		return mav;
	}
	
	@GetMapping("/setReviewerPage")
	public ModelAndView setReviewerPage(ModelAndView mav) {
		mav.setViewName("/lemon/setReviewerPage");
		ReviewerSetting rvwrs = new ReviewerSetting();
		mav.getModel().put("rvwrSet", rvwrs);
		return mav;
	}
	
	@GetMapping("/reviewerIttaomise")
	public String reviewerIttaomise(){
		return "/lemon/reviewerIttaomise";
	}
	
	@PostMapping(value="/setReviewerPage")
	public ModelAndView postSetting(ModelAndView mav,@ModelAttribute ReviewerSetting rvwrs) {
		
		System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
		Integer memberId = service.checkMemberId();
		
		System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"+memberId);
		System.out.println(rvwrs.getMember());
		System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
//		if(rvwrs.getMember()!=null) {
		rsr.updateTitle(memberId, rvwrs.getReviewer_title());
		rsr.updateSubTitle(memberId, rvwrs.getReviewer_subtitle());
		rsr.updateIntro(memberId, rvwrs.getReviewer_intro());
		rsr.updateCamera(memberId, rvwrs.getReviewer_camera());
		rsr.updateOccupation(memberId, rvwrs.getReviewer_occupation());
//		} else {
//			service.insert(rvwrs);
//		}
		
		
	
		mav.setViewName("redirect:/reviewerMainPage/");
		return mav;
	}
	
	
 
	
	
		
	
	
}
