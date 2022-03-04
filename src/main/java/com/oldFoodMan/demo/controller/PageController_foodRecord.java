package com.oldFoodMan.demo.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.oldFoodMan.demo.model.FoodRecord;
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
	
	//食記page
	@GetMapping("/totalRecord")   //查詢全部的轉頁(第1頁)controler
	public ModelAndView totalRecordPage(ModelAndView mav,@RequestParam(name="p",defaultValue = "1") Integer pageNumber) {
		
		mav.setViewName("record/totalRecord");
		Page<FoodRecord> page = service.findByPage(pageNumber);
		
		mav.getModel().put("page", page);
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
	
	//用ID看食記
		@GetMapping("/viewById")
		public ModelAndView viewOneRecord(ModelAndView mav, @RequestParam(name = "id") Integer id,HttpSession session){
			
			mav.setViewName("record/viewById");	
			FoodRecord fr = new FoodRecord();
			FoodRecord frById = service.findById(id);
			System.out.println("這裡是Food : "+frById);
			
			mav.getModel().put("foodRecord", fr);
			session.setAttribute("fr_ID", frById);  //將食記的ID存到session "fr_ID" 內
			mav.getModel().put("foodrecordById", frById);

			return mav;
		}

//------留言相關的Controller-----------------------------------------	
		
	//留言page
	@GetMapping("/viewMessages")
	public ModelAndView viewMessagePage(ModelAndView mav,@RequestParam(name="p", defaultValue = "1") Integer pageNumberMsg) {
		mav.setViewName("record/viewById");
		Page<RecordMessages> msg_page = msgService.findByPage(pageNumberMsg);  //回傳一個Page泛型的物件
		mav.getModel().put("msg_page", msg_page);   //再將這個Page傳回去  →"msg_page"是JSP會拿到的名字，JSP要讀這個page的物件
		return mav;
	}
	
	//看剛寫好的留言
		@GetMapping("/theLastestMsg")
		public ModelAndView theLastestMsg(ModelAndView mav) {
			mav.setViewName("record/viewOneRecord");
			RecordMessages rMsg = new RecordMessages();
			RecordMessages lastestMsg = msgService.getLastest();
			mav.getModel().put("recordMessage", rMsg);
			mav.getModel().put("lastestRecordMessages", lastestMsg);
			
			return mav;
		}
		
	//用ID看留言
		@GetMapping("/viewMsgById")
		public ModelAndView viewMsgById(ModelAndView mav, @RequestParam(name = "id") Integer id){
			mav.setViewName("record/viewById");	
			RecordMessages rMsg = new RecordMessages();
			RecordMessages msgById = msgService.findById(id);

			mav.getModel().put("recordMessage", rMsg);
			mav.getModel().put("recordMsgById", msgById);
			
			System.out.println("here Msg");
			return mav;
		}
	

}