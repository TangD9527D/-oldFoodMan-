package com.oldFoodMan.demo.controller;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.oldFoodMan.demo.dto.FoodVisDto;
import com.oldFoodMan.demo.model.Member;
import com.oldFoodMan.demo.model.OldFoodManBean;

import com.oldFoodMan.demo.service.OfmService;
@Controller
public class FoodVisController_32 {
	@Autowired
	private OfmService ofmservice;
	
	@PostMapping(value="/addFoodVis")
	public ModelAndView postNewMessage(ModelAndView mav,@Valid @ModelAttribute(name = "ofm") OldFoodManBean msg ,Member member,HttpSession hs,BindingResult rs) {
		Object id=hs.getAttribute("id");
		System.out.println("id: "+id);
		if(!rs.hasErrors()) {
			ofmservice.insert(msg);
			OldFoodManBean newMsg=new OldFoodManBean();
			mav.getModel().put("ofm", newMsg);
			
		}
		
		mav.getModel().put("ofm", id);
//		OldFoodManBean lastest=ofmservice.getLastest();
		mav.setViewName("redirect:/viewAllVis");
		
//		mav.getModel().put("lastestFoodVis", lastest);
		return mav;
	}
	
	
	
//	@ResponseBody
//	@GetMapping(value="messages/lastest")
//	public OldFoodManBean getLastest() {
//		
//		return ofmservice.getLastest();
//	}

	@GetMapping(value="editFoodVis")
	public ModelAndView editFoodVis(ModelAndView mav,@RequestParam(name="id") Integer id) {
		OldFoodManBean ofm=ofmservice.findById(id);
		mav.getModel().put("ofm", ofm);
		mav.setViewName("vis_group_jsp/editFoodVis");
		
		return mav;
		
		
	}
	
	
	@PostMapping("/editFoodVis")
	public ModelAndView editFoodVis(ModelAndView mav, @Valid @ModelAttribute(name="ofm") OldFoodManBean ofm, BindingResult result) {
		
		mav.setViewName("vis_group_jsp/editFoodVis");
		
		if(!result.hasErrors()) {
			// https://docs.spring.io/spring-data/jpa/docs/current/reference/html/#jpa.entity-persistence.saving-entites
			ofmservice.insert(ofm);
			 mav.setViewName("redirect:/ajaxFoodVis");
		}
		
		return mav;
		
		
	}
	
	@GetMapping(value="deleteFoodVis")
	public ModelAndView deleteMessage(ModelAndView mav,@RequestParam(name="id") Integer id) {
		ofmservice.delete(id);
		
		mav.setViewName("redirect:/viewAllVis");
		
		return mav;
	}
	
	@ResponseBody
	@PostMapping("/api/postFoodVis")
	public List<OldFoodManBean> postFoodVis(@RequestBody FoodVisDto dto,HttpSession hs){
		
		Object id=hs.getAttribute("id");
		
//		String vis_name=dto.getVis_name();
		String vis_res_name=dto.getVis_res_name();
		Date vis_date=dto.getVis_date();
//		String vis_email=dto.getVis_email();
		String vis_time=dto.getVis_time();
		String vis_location=dto.getVis_location();
		String vis_num=dto.getVis_num();
		String vis_condition=dto.getVis_condition();
		Integer member_id=dto.getMember_id();
		
		System.out.println("id:" + id);
		
		OldFoodManBean ofmVis=new OldFoodManBean();
//		ofmVis.setVis_name(vis_name);
		ofmVis.setVis_res_name(vis_res_name);
		ofmVis.setVis_date(vis_date);
//		ofmVis.setVis_email(vis_email);
		ofmVis.setVis_time(vis_time);
		ofmVis.setVis_location(vis_location);
		ofmVis.setVis_num(vis_num);
		ofmVis.setVis_condition(vis_condition);
		ofmVis.setMember_id(member_id);
		ofmservice.insert(ofmVis);
		
		Page<OldFoodManBean> page =ofmservice.findByPage(1);
		List<OldFoodManBean> list=page.getContent();
		
		return list;
		
	}
	@ResponseBody
	@GetMapping("/api/getFoodVis")
	public List<OldFoodManBean> getFoodVis(ModelAndView mav){
		
		List<OldFoodManBean> listall =ofmservice.findAll();
//		List<OldFoodManBean> list=page.getContent();
		
		return listall;
		
	}
	//ajax使用分頁
	@ResponseBody
	@GetMapping("/api/getFoodVisByPage")
	public List<OldFoodManBean> getFoodVisByPage(ModelAndView mav,@RequestParam(name="p",defaultValue = "1") Integer pageNumber,HttpSession hs){
		Object id=hs.getAttribute("id");
		Page<OldFoodManBean> page =ofmservice.findByPage(pageNumber);
		List<OldFoodManBean> list=page.getContent();
		mav.getModel().put("page", page);
		System.out.println("id: "+id);
		
		return list;
		
	}
	
	@GetMapping("/findOneVis")
	public ModelAndView findById(ModelAndView mav, @RequestParam(name="id") Integer id,HttpSession hs) {
		Object ids=hs.getAttribute("id");
		OldFoodManBean ofm=ofmservice.findById(id);
		mav.getModel().put("ofm", ofm);
		mav.setViewName("vis_group_jsp/findOneVis");
		System.out.println("id: "+ids);
		return mav;


		
	}
	
	
	
}
