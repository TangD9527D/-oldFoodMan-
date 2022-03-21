package com.oldFoodMan.demo.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.oldFoodMan.demo.model.Collections;
import com.oldFoodMan.demo.model.FoodRecord;
import com.oldFoodMan.demo.model.Member;
import com.oldFoodMan.demo.service.CollectionsService;

@Controller
public class CollectionsController {
	
	@Autowired
	CollectionsService service ;
	
	@ResponseBody
	@PostMapping(value="/likeCollections")//會員收藏文章功能 	
	public Collections insertCollections(@RequestParam(name="record_id") Integer record ,HttpSession hs) {
		
		
		Member mid = (Member)hs.getAttribute("member");
		FoodRecord fid=service.findByRecordId(record);
			
		System.out.println("ID?: "+fid);
		Collections find=service.findByMemberIdAndRecordId(mid, fid);
		
		return find ;

		
	}
	
	@ResponseBody
	@GetMapping(value="/findCollections")  //ajax查看是否有收藏的文章
	public Collections likeCollections(ModelAndView mav,HttpSession hs,@RequestParam(name="record_id") Integer record) {
		
		Member mid = (Member)hs.getAttribute("member");
		Integer id=mid.getId();
		System.out.println("mid:::"+mid);
		FoodRecord record_id=service.findByRecordId(record);
		
		System.out.println("id:"+id);
		
		Collections list=service.findRecord(mid, record_id);
		
		mav.getModel().put("likeCollections", list);			
		mav.setViewName("viewById");
		return list ;		
		
	}
	
	@ResponseBody
	@GetMapping(value = "/deleteCollections")  //依據會員ID及該食記ID刪除收藏的文章
	public void deleteCollections(@RequestParam(name="record_id") Integer record , HttpSession hs) {	
			
		Member mid = (Member)hs.getAttribute("member");
		FoodRecord id=service.findByRecordId(record);
		service.findByMemberIdDelete(mid, id);
			
	}
	
//	@ResponseBody
	@GetMapping("/findAllCollections")
	public ModelAndView findAllCollections(ModelAndView mav){
		mav.setViewName("/findAllCollections");
		
		List<Collections> list=service.findAllCollections();
		
		System.out.println("list歷史特:" + list );
		
		mav.getModel().put("list", list);
		
		
		
		return mav ;
			
	}
	
	
	@ResponseBody
	@GetMapping("/chartsAllCollections")
	public List<String> chartsAllCollections(ModelAndView mav){
			
		List<String> list=service.findAllChart();
		
		System.out.println("都看看是誰" + list);		
		
		return list; 
		
	}
	
	
	
	@ResponseBody
	@GetMapping("/chartsMemberCollections")
	public List<String> chartsMemberCollections(ModelAndView mav){
			
		List<String> list=service.findMemberChart();
		
		System.out.println("都看看是誰來了" + list);		
		
		return list; 
		
	}
	
	
	
	@GetMapping("/chartBiao")
	public ModelAndView AjaxAllCollections(ModelAndView mav) {
		
	
		mav.setViewName("backStageAllCollections");
		
		return mav ;
		
	}
	
	

}
