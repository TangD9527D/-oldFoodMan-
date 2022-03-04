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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.oldFoodMan.demo.dto.JoinVisDto;
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
	
	
//	@ResponseBody
	@PostMapping("/addjoinvis/{vis_id}")
	public ModelAndView addVis(ModelAndView mav,@ModelAttribute(name = "ofm") @PathVariable Integer vis_id,JoinVis joinvis, HttpSession session){
		Member member = (Member)session.getAttribute("member");
		
		
		System.out.println("idvis: "+vis_id);

		

		OldFoodManBean ofmvis=ofmservice.findById(vis_id);
		joinvis.setMember_id(member);
		joinvis.setMy_food_vis_id(ofmvis);
		
		System.out.println("第二個 條件:"+joinvis.getAdd_condition());
		
		System.out.println("第三個 :"+joinvis);
		
//		JoinVis josave=new JoinVis();
//		josave.setAdd_condition(joinvis.getAdd_condition());
//		josave.setMember_id(member);
//		josave.setMy_food_vis_id(ofmvis);
		jvservice.addJoinVis(joinvis,member,ofmvis); 
//		jvservice.insert(joinvis);
		
		mav.getModel().put("ofm", joinvis);
		mav.setViewName("redirect:/ajaxFoodVis");
		return mav;
	}
	
	
	
	
	
	
	
	
}