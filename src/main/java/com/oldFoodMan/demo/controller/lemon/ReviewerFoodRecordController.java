package com.oldFoodMan.demo.controller.lemon;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.oldFoodMan.demo.model.FoodRecord;
import com.oldFoodMan.demo.model.FoodRecordRepository;
import com.oldFoodMan.demo.model.Member;
import com.oldFoodMan.demo.model.lemon.Relationship;
import com.oldFoodMan.demo.model.lemon.ReviewerSetting;
import com.oldFoodMan.demo.model.lemon.ReviewerSettingRepository;
import com.oldFoodMan.demo.service.FoodRecordService;
import com.oldFoodMan.demo.service.MemberServiceImpl;
import com.oldFoodMan.demo.service.lemon.ReviewerSettingService;

@Controller
public class ReviewerFoodRecordController {

	@Autowired
	FoodRecordService foodRecordService;
	
	@Autowired
	FoodRecordRepository foodRecordRepository;
	
	@Autowired
	private ReviewerSettingRepository rsr;
	
	@Autowired
	private ReviewerSettingService service;
	
	@Autowired
	private MemberServiceImpl memberService;
	
	
	@GetMapping("/reviewerIttaomise")
	public ModelAndView reviewerIttaomise(ModelAndView mav,HttpSession hs) {
		Member memberData = (Member)hs.getAttribute("member");
		Integer memberId = memberData.getId();
		Integer count = foodRecordRepository.recordCounts(memberId);
		Date birthday = memberData.getBirth();
		String bdd = service.getAgeByMember(birthday);
		List<FoodRecord> frds = foodRecordService.memFoodRecords(memberId);
		ReviewerSetting reviewerBean = rsr.findByMember(memberId);
		Member memberBean = memberService.findById(memberId);
		mav.getModel().put("bdd", bdd);
		mav.getModel().put("reviewerPage", reviewerBean);
		mav.getModel().put("memberPage", memberBean);
		mav.getModel().put("count", count);
		mav.getModel().put("frds", frds);
		mav.setViewName("/lemon/reviewerIttaomise");
		
		return mav;
	}
	
	@GetMapping("/reviewerKoromi")
	public ModelAndView reviewerKoromi(ModelAndView mav,HttpSession hs) {
		Member memberData = (Member)hs.getAttribute("member");
		Integer memberId = memberData.getId();
		Integer count = foodRecordRepository.recordFavCounts(memberId);
		Date birthday = memberData.getBirth();
		String bdd = service.getAgeByMember(birthday);
		List<FoodRecord> frds = foodRecordRepository.recordFavorite(memberId);
		ReviewerSetting reviewerBean = rsr.findByMember(memberId);
		Member memberBean = memberService.findById(memberId);
		mav.getModel().put("bdd", bdd);
		mav.getModel().put("reviewerPage", reviewerBean);
		mav.getModel().put("memberPage", memberBean);
		mav.getModel().put("count", count);
		mav.getModel().put("frds", frds);
		mav.setViewName("/lemon/reviewerKoromi");
		
		return mav;
	}
	
//	@ResponseBody
//	@PostMapping("/reviewerIttaomise/area/{opt}")
//	public int followUser(@PathVariable String opt,HttpSession hs){
//		Member memberData = (Member)hs.getAttribute("member");
//		Integer memberId = memberData.getId();
//		System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~"+opt);
//		List<FoodRecord> frds = foodRecordRepository.recordCitySort(opt, memberId);
//		mav.getModel().put("frds",frds);
//		int Area= 1;
//        return Area;
//	}
	
}
