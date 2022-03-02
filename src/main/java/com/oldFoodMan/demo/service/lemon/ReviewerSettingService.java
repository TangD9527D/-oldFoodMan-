package com.oldFoodMan.demo.service.lemon;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oldFoodMan.demo.model.lemon.ReviewerSetting;
import com.oldFoodMan.demo.model.lemon.ReviewerSettingDao;

@Service
public class ReviewerSettingService {

	@Autowired
	private ReviewerSettingDao dao;
	
	public void insert(ReviewerSetting rvwrst) {
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
	
}
