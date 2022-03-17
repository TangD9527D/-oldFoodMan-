package com.oldFoodMan.demo.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.oldFoodMan.demo.dto.RecordMessageDto;
import com.oldFoodMan.demo.model.FoodRecord;
import com.oldFoodMan.demo.model.Member;
import com.oldFoodMan.demo.model.RecordMessages;
import com.oldFoodMan.demo.service.FoodRecordService;
import com.oldFoodMan.demo.service.RecordMessageService;




@Controller
public class PageController_foodRecord {
	
	@Autowired
	private FoodRecordService service;
	
	@Autowired
	private RecordMessageService msgService;
	
	@GetMapping("/fr")
	public String FoodRecord_MainPage() {
		return "FoodRecord_Main";
	}
	
	@GetMapping("/createData")
	public ModelAndView createDataPage(ModelAndView mav) {    //只能去到createData的頁面，還不能post資料	
		mav.setViewName("record/createData");  //回傳view的位置
		FoodRecord rf = new FoodRecord();  //再將rf回傳回去
		mav.getModel().put("foodRecord", rf);  //因為是個map,所以要使用put。put()內放的是key&value的值:key隨便放(幫value命名)，value放想放的物件
		return mav;
	}
	
	//會員食記List
	@GetMapping("/MemberRecordList")
	public ModelAndView MemberRecordList(ModelAndView mav,HttpSession session) {
		mav.setViewName("record/MemberRecordList");
		Member member = (Member)session.getAttribute("member"); //session.getAttribute("member")是個物件，所以轉型別為Member的型別
		Integer member_id = member.getId();
		System.out.println("member_id = "+member_id);
		List<FoodRecord> mfl = service.memFoodRecords(member_id);
		System.out.println("mfl = "+mfl);
		mav.getModel().put("mfl", mfl);
		return mav;
	}
	
	
	//食記page
	@GetMapping("/totalRecord")   //查詢全部的轉頁(第1頁)controler
	public ModelAndView totalRecordPage(ModelAndView mav,@RequestParam(name="p",defaultValue = "1") Integer pageNumber) {	
		mav.setViewName("record/totalRecord");
		Page<FoodRecord> page = service.findByPage(pageNumber);
		
		mav.getModel().put("page", page);
		return mav;
	}
	
	//食記管理page
		@GetMapping("/RecordManagement")   //查詢全部的轉頁(第1頁)controler
		public ModelAndView RecordManagement(ModelAndView mav) {		
			mav.setViewName("record/RecordManagement");
			List<FoodRecord> page = service.findAllRecord();
			mav.getModel().put("page", page);
			return mav;
		}
		
	//食記分析page
		@ResponseBody
		@GetMapping("/RecordAnalysis") 
		public ModelAndView RecordAnalysis(ModelAndView mav,@RequestBody FoodRecord foodRecord) {		
			mav.setViewName("record/RecordAnalysis");
			List<FoodRecord> type = service.typeFilter();
//			System.out.println("type ="+type);
			mav.getModel().put("type", type);
			return mav;
		}
		
	//看剛寫好的食記
	@GetMapping("/theLastestRecord")
	public ModelAndView theLastestRecord(ModelAndView mav) {
		mav.setViewName("record/viewOneRecord");
		FoodRecord fr = new FoodRecord();
		FoodRecord lastestFr = service.getLastest();
		
		mav.getModel().put("foodRecord", fr);  //是TotalRecord中c:out 的var
		mav.getModel().put("lastestFoodRecord", lastestFr);
		
		return mav;
	}
	
			
	
	
	//----MSG page--------------
	
	@GetMapping("/theLastestMSG")
	public ModelAndView theLastestMSG(ModelAndView mav) {
		mav.setViewName("record/viewById");
		RecordMessages msg = new RecordMessages();
		RecordMessages lastestMsg = msgService.getLastest();
		
		mav.getModel().put("lastestMsg", msg);  //是TotalRecord中c:out 的var
		mav.getModel().put("lastestMsg", lastestMsg);
		
		return mav;
	}
	

	//留言管理page
	@GetMapping("/MsgManagement")   //查詢全部的轉頁(第1頁)controler
	public ModelAndView MsgManagement(ModelAndView mav) {
		
		mav.setViewName("record/MsgManagement");
		List<RecordMessages> MSG = msgService.findAllMsg();
		mav.getModel().put("MSG", MSG);
		return mav;
	}
	
	
	//顯示該食記的留言
	@GetMapping("/viewById")
	public ModelAndView MsgListByRecordId(ModelAndView mav, @RequestParam(name = "id") Integer id,@RequestParam(name="p", defaultValue = "1") Integer pageNumberMsg,HttpSession session){
		mav.setViewName("record/viewById");	
		System.out.println("viewById+MsgListByRecordId的混合");
		FoodRecord fr = new FoodRecord();
		FoodRecord frById = service.findById(id);
		mav.getModel().put("foodRecord", fr);
		mav.getModel().put("foodrecordById", frById);
		session.setAttribute("sessionRecordId", frById);
		
		FoodRecord recordId = (FoodRecord)session.getAttribute("sessionRecordId");
		Integer RecordId = recordId.getId();
		System.out.println("RecordId = "+RecordId);
		List<RecordMessages> mlbri = msgService.MsgListByRecordId(RecordId);
		System.out.println("mlbri = "+mlbri);
		mav.getModel().put("mlbri", mlbri);

		return mav;
	}		
	
	


}