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
import com.oldFoodMan.demo.model.TestOFM;
import com.oldFoodMan.demo.service.OfmService;
import com.oldFoodMan.demo.service.TestOfmService;


@Controller
public class PageController_32 {
	

	
	@Autowired
	private OfmService serviceOfm;
	
	@Autowired
	private TestOfmService tservice;
	
	@GetMapping("/analyzeVis")
	public ModelAndView ajaxPage(ModelAndView mav) {

		mav.setViewName("/vis_group_jsp/analyzeVis");

		return mav;
	}
	
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
	
	@GetMapping("/ajaxFoodVis")
	public ModelAndView viewVisPage(ModelAndView mav,@RequestParam(name="p",defaultValue = "1") Integer pageNumber,HttpSession hs) {
		Member mid = (Member)hs.getAttribute("member");

		mav.setViewName("vis_group_jsp/ajaxFoodVis");	
		
		Page<OldFoodManBean> page =serviceOfm.findByPage(pageNumber);
		
		mav.getModel().put("page", page);
		mav.getModel().put("ofmid", mid);
		System.out.println("memberid: "+mav);
		
		return mav;
	}
	

	
	@GetMapping("/viewAllVis")
	public ModelAndView viewAllVisPage(ModelAndView mav) {
		mav.setViewName("vis_group_jsp/viewAllVis");
		
		List<OldFoodManBean>list  =serviceOfm.findAllAndMember();
		List<Member> listmember=serviceOfm.findAllAndMemberId();
		System.out.println("想看看有啥: "+list);
		
		mav.getModel().put("list", list);
		mav.getModel().put("listmember", listmember);

		return mav;
	}
	
	@ResponseBody
	@GetMapping("/api/viewAllAnalyze")
	public List<String> viewAllVisPageAnalyze() {
		
		List<String>list  =tservice.findvisdate();

		
		System.out.println("想看看有啥: "+list);
		

		return list;
	}

}
