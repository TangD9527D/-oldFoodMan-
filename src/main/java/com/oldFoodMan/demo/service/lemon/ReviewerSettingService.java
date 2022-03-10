package com.oldFoodMan.demo.service.lemon;


import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oldFoodMan.demo.model.Member;
import com.oldFoodMan.demo.model.lemon.ReviewerSetting;
import com.oldFoodMan.demo.model.lemon.ReviewerSettingDao;

@Service
public class ReviewerSettingService {

	@Autowired
	private ReviewerSettingDao dao;
	
	@Autowired
	private HttpSession hs;
	
	
	public Integer checkMemberId() {
		Member member = (Member)hs.getAttribute("member");
		Integer id = member.getId();
		return id;
	}
	
	public void insert(ReviewerSetting rvwrst) {
		Member member = (Member)hs.getAttribute("member");
		rvwrst.setMember(member);
		dao.save(rvwrst);
	}
	
	public List<ReviewerSetting> findAll() {
		List<ReviewerSetting> list = dao.findAll();
		return list;
	}
	

	
	public ReviewerSetting findById(Integer id) {
		Optional<ReviewerSetting> op = dao.findById(id);
		if(op.isPresent()) {
			return op.get();
		}
		return null;
	}
	
	public String getAgeByMember(Date birthday) {
		Calendar cal = Calendar.getInstance();
		Calendar bir = Calendar.getInstance();
		bir.setTime(birthday);
		if(cal.before(birthday)) {
			throw new IllegalArgumentException("The birthday is before Now,It's unbelievable");
		}
		Integer yearNow = cal.get(Calendar.YEAR);
		Integer monthNow = cal.get(Calendar.MONTH);
		Integer dayNow = cal.get(Calendar.DAY_OF_MONTH);
		
		Integer yearBirth = bir.get(Calendar.YEAR);
		Integer monthBirth = bir.get(Calendar.MONTH);
		Integer dayBirth = bir.get(Calendar.DAY_OF_MONTH);
		
		Integer age = yearNow-yearBirth;
		if(monthNow<monthBirth||(monthNow==monthBirth && dayNow<dayBirth)) {
			age--;
		}
		
		String outputAge = "";
		
		Integer agee = age/10;
		switch(agee) {
		case 1:
			outputAge = "十歲年代";
			break;
		case 2:
			outputAge = "二十歲年代";
			break;
		case 3:
			outputAge = "三十歲年代";
			break;
		case 4:
			outputAge = "四十歲年代";
			break;
		case 5:
			outputAge = "五十歲年代";
			break;
		default:
			outputAge = "年齡是秘密";
			break;
		}
		
		return outputAge;
	}
	
}
