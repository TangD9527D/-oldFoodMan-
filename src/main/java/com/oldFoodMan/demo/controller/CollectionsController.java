package com.oldFoodMan.demo.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.oldFoodMan.demo.model.Collections;
import com.oldFoodMan.demo.model.FoodRecord;
import com.oldFoodMan.demo.model.Member;
import com.oldFoodMan.demo.service.CollectionsService;

@Controller
public class CollectionsController {
	
	@Autowired
	CollectionsService service ;
	
	
	@PostMapping(value="/likeCollections")
	public void insertCollections(Integer record ,HttpSession hs) {
		
		Member mid = (Member)hs.getAttribute("member");
		FoodRecord id=service.findByRecordId(record);
		
		service.insert(id, mid);
		
	}
		
	@GetMapping(value="/likeCollections")  //查收藏的文章
	public ModelAndView likeCollections(ModelAndView mav,HttpSession hs) {
		
		Member mid = (Member)hs.getAttribute("member");
		Integer id=mid.getId();
		
		
		System.out.println("id:"+id);
		
		List<Collections> list=service.findClotById(mid);				
		
		mav.getModel().put("likeCollections", list);			
		mav.setViewName("");
		return mav ;		
		
	}
			
	@GetMapping(value = "/deleteCollections")  //依據會員ID即該食記ID刪除收藏的文章
	public void deleteCollections(@RequestParam(name="record_id") Integer record , HttpSession hs) {	
			
		Member mid = (Member)hs.getAttribute("member");
		FoodRecord id=service.findByRecordId(record);
		service.findByMemberIdDelete(mid, id);
			
	}
	
	

}