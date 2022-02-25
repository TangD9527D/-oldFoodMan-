package com.oldFoodMan.demo.controller;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.oldFoodMan.demo.model.OldFoodManTest;
import com.oldFoodMan.demo.service.OldFoodManServiceTest;


@Controller
public class PageController_02 {

	@Autowired
	private OldFoodManServiceTest service;

	
	
	@GetMapping("searchMaps")
	public String map11() {
	
	return "maps";
}



	@GetMapping("/ajaxMessages")
	public ModelAndView ajaxPage(ModelAndView mav) {

		mav.setViewName("messages/ajaxMessages");

		return mav;
	}


	
	@ResponseBody
	@GetMapping("api/searchMaps")
	public List<OldFoodManTest> mapsAjax(ModelAndView mav){
		
	List<OldFoodManTest> list =service.findAll();
		
		return list ;	
		
	}

}
