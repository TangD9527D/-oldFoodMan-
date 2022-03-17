package com.oldFoodMan.demo.controller.lemon;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.oldFoodMan.demo.model.FoodRecord;
import com.oldFoodMan.demo.model.FoodRecordRepository;
import com.oldFoodMan.demo.model.Member;
import com.oldFoodMan.demo.model.lemon.Relationship;
import com.oldFoodMan.demo.model.lemon.ReviewerSaveRating;
import com.oldFoodMan.demo.model.lemon.ReviewerSetting;
import com.oldFoodMan.demo.model.lemon.ReviewerSettingRepository;
import com.oldFoodMan.demo.service.FoodRecordService;
import com.oldFoodMan.demo.service.MemberServiceImpl;
import com.oldFoodMan.demo.service.lemon.ReviewerFoodRecordService;
import com.oldFoodMan.demo.service.lemon.ReviewerSettingService;

@Controller
public class ReviewerFoodRecordController {

	@Autowired
	private ReviewerFoodRecordService rfrService;
	
	@Autowired
	private FoodRecordService foodRecordService;
	
	@Autowired
	private FoodRecordRepository foodRecordRepository;
	
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
	
	@GetMapping("/savingTop/{record_id}")
	public ModelAndView followUser(@PathVariable Integer record_id,ModelAndView mav){
		ReviewerSaveRating rsr = rfrService.checkRsr(record_id);
		rfrService.saveRatingg(record_id, rsr);
		mav.setViewName("redirect:/reviewerMainPage");
        return mav;
	}
	
	
	@PostMapping("/ittaomise/search/city")
	public ModelAndView articleSearch(@RequestParam(value="cityvalue")Integer cityValue,ModelAndView mav) {
		System.out.println("~~~~~~~~~~~~");
//		String city = cityValue;
//		List<FoodRecord> frds = rfrService.cityTaipei1(city);
//		mav.getModel().put("frds", frds);
		mav.setViewName("/lemon/reviewerIttaomise");
		return mav;
		
	}
}
