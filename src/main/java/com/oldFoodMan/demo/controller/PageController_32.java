package com.oldFoodMan.demo.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.oldFoodMan.demo.model.Member;
import com.oldFoodMan.demo.model.OldFoodManBean;

import com.oldFoodMan.demo.service.OfmService;


@Controller
public class PageController_32 {
	
//	@Autowired
//	private WorkMessagesService service;
	
	@Autowired
	private OfmService serviceOfm;

//	@GetMapping("/")
//	public String Home() {
//		
//		return "index";
//		
//	}
//	@GetMapping("/about")
//	public String aboutPage() {
//		
//		return "/messages/about";
//	}
	
	
//	@GetMapping("/addMessage")
//	public ModelAndView addMessagePage(ModelAndView mav) {
//		
//		mav.setViewName("messages/addMessage");
//		
//		WorkMessages msg = new WorkMessages();
//		WorkMessages lastest=service.getLastest();
//		mav.getModel().put("workMessages", msg);
//		mav.getModel().put("lastestMessages", lastest);
//		
//		return mav;
//	}
	
	@GetMapping("/addFoodVis")
	public ModelAndView addFoodVisPage(ModelAndView mav,HttpSession hs) {
		
		
		Member mid = (Member)hs.getAttribute("member");
		
		mav.setViewName("vis_group_jsp/addFoodVis");
		OldFoodManBean ofmb=new OldFoodManBean();
		
//		OldFoodManBean lastest=serviceOfm.getLastest();
		mav.getModel().put("ofm", ofmb);
		mav.getModel().put("ofmid", mid);
		System.out.println("id= "+ mid);
//		mav.getModel().put("lastestFoodVis", lastest);
		return mav;
	}
	
//	@GetMapping("/ajaxFoodVis")
	public ModelAndView viewVisPage(ModelAndView mav,@RequestParam(name="p",defaultValue = "1") Integer pageNumber,HttpSession hs) {
		Member mid = (Member)hs.getAttribute("member");

		mav.setViewName("vis_group_jsp/ajaxFoodVis");	
		
		Page<OldFoodManBean> page =serviceOfm.findByPage(pageNumber);
		
		mav.getModel().put("page", page);
		mav.getModel().put("ofmid", mid);
		System.out.println("id: "+mav);
		
		return mav;
	}
	
	@GetMapping("/viewAllVis")
	public ModelAndView viewAllVisPage(ModelAndView mav,@RequestParam(name="p",defaultValue = "1") Integer pageNumber) {
		mav.setViewName("vis_group_jsp/viewAllVis");
		
		Page<OldFoodManBean> page =serviceOfm.findByPage(pageNumber);
		mav.getModel().put("page", page);
		
		return mav;
	}
	
//	@GetMapping("/ajaxFoodVis")
//	public ModelAndView ajaxPage(ModelAndView mav) {
//		
//		mav.setViewName("messages/ajaxFoodVis");
//		
//		return mav;
//		
//	}
}
