package com.oldFoodMan.demo.service.lemon;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.hibernate.internal.build.AllowSysOut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oldFoodMan.demo.model.FoodRecord;
import com.oldFoodMan.demo.model.FoodRecordRepository;
import com.oldFoodMan.demo.model.Member;
import com.oldFoodMan.demo.model.lemon.ReviewerFoodRecordRepository;
import com.oldFoodMan.demo.model.lemon.ReviewerSaveRating;
import com.oldFoodMan.demo.model.lemon.ReviewerSaveRatingRepository;
import com.oldFoodMan.demo.model.lemon.User;
import com.oldFoodMan.demo.service.FoodRecordService;

@Service
public class ReviewerFoodRecordService {

	@Autowired
	private FoodRecordService frs;
	
	@Autowired
	private FoodRecordRepository frr;
	
	@Autowired
	private ReviewerSaveRatingRepository rsrr;
	
	
	public void saveRatingg(Integer record_id,ReviewerSaveRating rsr) {
		
		FoodRecord frds = frs.findById(record_id);
			
			Member member= frds.getMember_id();
			Integer memberId = member.getId();
			Integer gender = frds.getGender();
			Integer gender1 = frds.getGender1();
			Integer gender2 = frds.getGender2();
			Integer genderSum = gender+gender1+gender2;
			float genderAvg = genderSum/3;
			String storeName = frds.getShopName();
			String storeCity = frds.getCity();
			String storeArea = frds.getTown();
			String storeType = frds.getShopType();
			String articalTitle = frds.getCp();
			
			System.out.println("~~~~~~~~~");
			System.out.println(record_id);
			System.out.println(genderSum);
			System.out.println(genderAvg);
			System.out.println(storeName);
			System.out.println(storeCity);
			System.out.println(storeArea);
			System.out.println(storeType);
			System.out.println(articalTitle);
			System.out.println("~~~~~~~~~");
			
			
			rsr.setRecord_id(record_id);
			rsr.setMember_id(memberId);
			rsr.setGender_sum(genderSum);
			rsr.setGender_avg(genderAvg);
			rsr.setStore_name(storeName);
			rsr.setStore_city(storeCity);
			rsr.setStore_area(storeArea);
			rsr.setStore_type(storeType);
			rsr.setArtical_title(articalTitle);
			
			rsrr.save(rsr);
	}
		
	public ReviewerSaveRating findByMember(Integer memberId) {
		ReviewerSaveRating rsrReady = rsrr.findByMember(memberId);
		if(rsrReady!=null) {
			return rsrReady;
		} else {
			rsrr.insertByMember(memberId);
			ReviewerSaveRating rsrReadyy =  rsrr.findByMember(memberId);
			return rsrReadyy;
		}
	}
	
	public ReviewerSaveRating checkRsr(Integer record_id) {
		ReviewerSaveRating rsrReady = rsrr.findByRecord(record_id);
		if(rsrReady!=null) {
			return rsrReady;
		} else {
			ReviewerSaveRating rsrReadyy = new ReviewerSaveRating(); 
			return rsrReadyy;
		}
	}
}
