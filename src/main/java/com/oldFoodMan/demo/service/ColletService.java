package com.oldFoodMan.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oldFoodMan.demo.model.ColletRepository;
import com.oldFoodMan.demo.model.FoodRecord;

@Service
public class ColletService {
	
	@Autowired
	private ColletRepository cdao ;
	
	public List<FoodRecord> findByShopType(String shopType) {
		
		List<FoodRecord> st=cdao.findByShopType(shopType);
		
		return st;
		
		
	}
	
	


}
