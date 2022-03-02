package com.oldFoodMan.demo.controller.lemon;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.oldFoodMan.demo.model.lemon.ReviewerSetting;
import com.oldFoodMan.demo.service.lemon.ReviewerSettingService;

@Controller
public class ReviewerSettingController {
	
	@Autowired
	private ReviewerSettingService service;
	
	@GetMapping("/reviewerMainPage")
	public String reviewerMainPage() {
		return "/lemon/reviewerMainPage";
	}
	
	@GetMapping("/setReviewerPage")
	public ModelAndView setReviewerPage(ModelAndView mav) {
		mav.setViewName("/lemon/setReviewerPage");
		ReviewerSetting rvwrs = new ReviewerSetting();
		mav.getModel().put("rvwrSet", rvwrs);
		return mav;
	}
	
	@PostMapping(value="/setReviewerPage")
	public ModelAndView postSetting(ModelAndView mav,@ModelAttribute ReviewerSetting rvwrs) {
		service.insert(rvwrs);
		mav.setViewName("/lemon/reviewerMainPage");
		return mav;
	}
	
	
 
	
	
		
	
	
}
