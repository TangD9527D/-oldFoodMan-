package com.oldFoodMan.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	@GetMapping("api/searchMaps1")
	public List<OldFoodManTest> mapsAjax(ModelAndView mav) {		

		List<OldFoodManTest> list = service.findAll();

		return list;

	}

	@ResponseBody
	@GetMapping("api/searchMaps")
	public ModelAndView mapsAjaxPage(ModelAndView mav,
			@RequestParam(name = "p", defaultValue = "1") Integer pageNumber) {

		mav.setViewName("searchMaps");

		Page<OldFoodManTest> page = service.findByPage(pageNumber);
		
		
		mav.getModel().put("page", page);
		
		return mav;

	}
	
	@ResponseBody
	@GetMapping("api/searchMaps2")
	public List<OldFoodManTest> mapsAjaxPage2(ModelAndView mav,
			@RequestParam(name = "p", defaultValue = "1") Integer pageNumber) {		
		
		
		Page<OldFoodManTest> page=service.findByPage(pageNumber);
		List<OldFoodManTest> list = page.getContent();
		
		mav.getModel().put("page", page);

		return list;

	}

}