package com.oldFoodMan.demo.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.oldFoodMan.demo.dto.ScheduleDto;
import com.oldFoodMan.demo.model.FoodRecord;
import com.oldFoodMan.demo.model.Member;
import com.oldFoodMan.demo.model.ScheduleBean;
import com.oldFoodMan.demo.service.ScheduleService;

@Controller
public class ScheduleController {
	
	@Autowired
	ScheduleService service;
	
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
		
		service.insert(loc);
		//回傳一個物件
//		Page<ScheduleBean> page=scheduleservice.findByPage(1);
//		List<ScheduleBean> list=page.getContent();
		
		return loc ;	
		
	}
	
	@ResponseBody
	@GetMapping("/likelocold")
	public ScheduleBean printLikeLocation(@RequestBody ScheduleDto dto , HttpSession hs) {
		
		Member mid = (Member)hs.getAttribute("member");
		Integer id=mid.getId();
		
		String locations =dto.getLikeLocations();
				
		System.out.println("id:"+id);
		
		ScheduleBean loc=new ScheduleBean();
		
		loc.setLikelocations(locations);
		loc.setMember_id(id);
		
		service.insert(loc);
		
		return loc ;	
	}
	
	@ResponseBody
	@GetMapping("likeloc")
	public List<ScheduleBean> mapsAjax(ModelAndView mav,@RequestParam(value="member_id")Integer id,HttpSession hs ) {

		Member mid = (Member)hs.getAttribute("member");
		Integer idd=mid.getId();
		System.out.println("當下的: "+id);
		List<ScheduleBean> list = service.findByIdlike(id);

		return list;

	}
	
	@ResponseBody
	@GetMapping("/deleteSchedule")
	public void deleteSchedule(@RequestParam(name="schedule_id") Integer id) {
		
		
		service.delete(id);
		
	}
	
	
	

}
