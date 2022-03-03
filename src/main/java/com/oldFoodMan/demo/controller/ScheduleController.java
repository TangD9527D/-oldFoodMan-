package com.oldFoodMan.demo.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oldFoodMan.demo.dto.ScheduleDto;
import com.oldFoodMan.demo.model.Member;
import com.oldFoodMan.demo.model.ScheduleBean;
import com.oldFoodMan.demo.service.ScheduleService;

@Controller
public class ScheduleController {
	
	@Autowired
	ScheduleService scheduleservice;
	
	@ResponseBody
	@PostMapping("/locations")
	
	public ScheduleBean likeLocation(@RequestBody ScheduleDto dto,HttpSession hs){
		
		Member mid = (Member)hs.getAttribute("member");
		Integer id=mid.getId();
		
		String locations =dto.getLikeLocations();
				
		System.out.println("id:"+id);
		
		ScheduleBean loc=new ScheduleBean();
		
		loc.setLikelocations(locations);
		loc.setMember_id(id);
		
		scheduleservice.insert(loc);
		//回傳一個物件
//		Page<ScheduleBean> page=scheduleservice.findByPage(1);
//		List<ScheduleBean> list=page.getContent();
		
		return loc ;
		
		
	}
	
	
}