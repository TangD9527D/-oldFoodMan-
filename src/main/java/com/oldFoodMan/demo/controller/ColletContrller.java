package com.oldFoodMan.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.oldFoodMan.demo.dto.ColletDto;
import com.oldFoodMan.demo.model.FoodRecord;
import com.oldFoodMan.demo.service.ColletService;

@Controller
public class ColletContrller {
	
	@Autowired
	ColletService service;
	
	@ResponseBody
	@GetMapping("/collet")
	public List<FoodRecord> colletRecord(ModelAndView mav,@RequestBody ColletDto dto) {
		
		System.out.println("shopType:"+dto.getLikeLocations());
		mav.setViewName("maps2");
		
		List<FoodRecord> st =service.findByShopType(dto.getLikeLocations());
			
		mav.getModel().put("st", st);		

		return st ;
		
	}
	
	
	
	
	
	
	

}
