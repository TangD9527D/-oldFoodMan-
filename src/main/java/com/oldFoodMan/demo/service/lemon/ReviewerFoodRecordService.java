package com.oldFoodMan.demo.service.lemon;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.hibernate.internal.build.AllowSysOut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oldFoodMan.demo.model.FoodRecord;
import com.oldFoodMan.demo.model.FoodRecordRepository;
import com.oldFoodMan.demo.model.lemon.ReviewerFoodRecordRepository;
import com.oldFoodMan.demo.model.lemon.ReviewerSaveRating;
import com.oldFoodMan.demo.model.lemon.ReviewerSaveRatingRepository;
import com.oldFoodMan.demo.service.FoodRecordService;

@Service
public class ReviewerFoodRecordService {

	@Autowired
	private FoodRecordService frs;
	
	@Autowired
	private FoodRecordRepository frr;
	
	@Autowired
	private ReviewerSaveRatingRepository rsrr;
	
	
	public List<FoodRecord> getTopFiveRating(Integer id) {
		
		List<FoodRecord> frds = frr.memberRecordList(id);
		
		for(int i=0;i<frds.size();i++){
			Integer recordId = frds.get(i).getId();
			Integer gender = frds.get(i).getGender();
			Integer gender1 = frds.get(i).getGender1();
			Integer gender2 = frds.get(i).getGender2();
			Integer genderSum = gender+gender1+gender2;
			
			System.out.println("~~~~~~~~~"+recordId);
			
			ReviewerSaveRating rsr = new ReviewerSaveRating();
			rsr.setRecordId(recordId);
			rsr.setGender(gender);
			rsr.setGender1(gender1);
			rsr.setGender2(gender2);
			rsr.setGendersum(genderSum);
			rsrr.save(rsr);
		}
		
		List<FoodRecord> reTop = new ArrayList<>();
		List<ReviewerSaveRating> relist = rsrr.topFiveRating();
		for(int i=0;i<relist.size();i++) {
			Integer recordId = relist.get(i).getRecordId();
			FoodRecord fr = frs.findById(recordId);
			reTop.add(i, fr);
			
			System.out.println("~~~~~~~~~"+recordId);
		}
		
		return reTop;
	}
}
