package com.oldFoodMan.demo.service.lemon;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oldFoodMan.demo.model.FoodRecord;
import com.oldFoodMan.demo.model.Member;
import com.oldFoodMan.demo.model.lemon.ReviewerFoodRecordRepository;

@Service
public class ReviewerFoodRecordService {

	@Autowired
	private ReviewerFoodRecordRepository rfrr;
	
	@Autowired
	private HttpSession hs;
	
	public void topFiveRating() {
		Member member = (Member)hs.getAttribute("member");
		Integer id = member.getId();
		List<FoodRecord> frds = rfrr.foodRecordByMember(id);
		
	}
}
