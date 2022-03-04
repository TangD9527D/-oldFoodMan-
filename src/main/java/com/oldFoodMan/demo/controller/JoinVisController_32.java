package com.oldFoodMan.demo.controller;



import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.oldFoodMan.demo.model.JoinVis;
import com.oldFoodMan.demo.model.Member;
import com.oldFoodMan.demo.model.OldFoodManBean;
import com.oldFoodMan.demo.service.JoinVisService;
import com.oldFoodMan.demo.service.OfmService;

@Controller
public class JoinVisController_32 {
	
	@Autowired
	private JoinVisService jvservice;
	
	@Autowired
	private OfmService ofmservice;
	
	
	@GetMapping("/joinvisall")
	public String joinVisAll(Model model) {
		List<JoinVis> joinvisall = jvservice.findAll();
		model.addAttribute("joinvisall", joinvisall); 
		return "";
	}
	
	
	@ResponseBody
	@PostMapping("/addjoinvis/{vis_id}")
	public ModelAndView addVis(ModelAndView mav,@ModelAttribute(name = "ofmvis") @PathVariable Integer vis_id,JoinVis joinvis, HttpSession session){
		Member member = (Member)session.getAttribute("member");
		
		System.out.println("idvis: "+vis_id);
		System.out.println("有沒有拿到: "+joinvis);
		
		
		OldFoodManBean ofmvis=ofmservice.findById(vis_id);
		String condition=joinvis.getAdd_condition();
		
		JoinVis joinvisadd=new JoinVis();
		
		joinvisadd.setMember_id(member);
		joinvisadd.setMy_food_vis_id(ofmvis);
		joinvisadd.setAdd_condition(condition);
		
		System.out.println("第二個:"+joinvis.getAdd_condition());
		System.out.println("第三個:"+joinvisadd);
		
		jvservice.addJoinVis(joinvisadd); 
		
		
		mav.getModel().put("ofmvis", joinvisadd);
		mav.setViewName("redirect:/ajaxFoodVis");
		return mav;
	}
	
	
	
	
	
	
	
	
}
