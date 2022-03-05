package com.oldFoodMan.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.oldFoodMan.demo.dto.ColletDto;
import com.oldFoodMan.demo.model.FoodRecord;
import com.oldFoodMan.demo.service.ColletService;

@Controller
public class ColletContrller {
	
	@Autowired
	ColletService service;
	

	@GetMapping("/colletdate")
	public ModelAndView colletRecord(ModelAndView mav,@RequestParam(name="shopType") String shopType ) {
		
		System.out.println("shopType:"+ shopType);
		
		
		List<FoodRecord> st =service.findByShopType(shopType);
		
		mav.getModel().put("st", st);		
		mav.setViewName("collet");
		return mav ;
		
	}
	
	
//	@ResponseBody
//	@GetMapping("/collet")
//	public List<FoodRecord> colletRecordajax(ModelAndView mav,@RequestParam(name="shopType") String shopType) {
//		
//		System.out.println("shopType:"+ shopType);
//		
//		
//		List<FoodRecord> st =service.findByShopType(shopType);
//		
//		mav.getModel().put("st", st);		
//		mav.setViewName("maps");
//		return st ;
//		
//	}
	
	@ResponseBody
	@GetMapping("/collet")
	public List<FoodRecord> searchRecord (ModelAndView mav ,@RequestParam(name="shopType")String shopType){		
		
		System.out.println("shopType:" + shopType);
		
		List<FoodRecord> st = service.findByShopType(shopType);
		
		mav.getModel().put("st", st);
		mav.setViewName("maps");
		return st ;
		
		
	}
	
	
	
	
	

}
