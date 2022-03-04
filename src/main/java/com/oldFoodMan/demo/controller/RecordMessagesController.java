package com.oldFoodMan.demo.controller;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.oldFoodMan.demo.dto.RecordMessageDto;
import com.oldFoodMan.demo.model.FoodRecord;
import com.oldFoodMan.demo.model.Member;
import com.oldFoodMan.demo.model.RecordMessages;
import com.oldFoodMan.demo.service.RecordMessageService;



@Controller
public class RecordMessagesController {
	
	@Autowired
	private RecordMessageService msgService;
	
	
	//api
		@ResponseBody   //因為是要回傳json所以要用@ResopnseBody (ModelAndView 是回傳一個View)
		@PostMapping("/api/postMessage")		
		public List<RecordMessages> postMessageApi(@RequestBody RecordMessageDto dto,HttpSession session){  //@RequestBody RecordMessageDto 請求的本體(送進來的) ；List<RecordMessages>回傳回去的
			RecordMessages foodMsg = new RecordMessages();   //因為是新增資料，所以需要new
			String text = dto.getMsg();     //從dto拿到值，這是一個String的text	
			foodMsg.setText(text);    //然後把text送給foodMsg	
			
			Member member = (Member)session.getAttribute("member");
			System.out.println("member = "+member);
			FoodRecord sessionRecordId = (FoodRecord)session.getAttribute("sessionRecordId");
			
			Integer memberId = member.getId();
			Integer RecordId = sessionRecordId.getId();
			
			foodMsg.setMember_id(member);
			System.out.println("會員ID = "+member);
			
			foodMsg.setRecord_id(sessionRecordId);
			System.out.println("食記ID = "+sessionRecordId);
			
			
			msgService.insertMessage(foodMsg); //先存食記
			

	
			Page<RecordMessages> msg_page = msgService.findByPage(1);  // 回傳前N個資料,1表示第一頁。 會回傳一個page的物件
			List<RecordMessages> list = msg_page.getContent();    //page物件需要用getContent()方法才能拿到List
			
			return list;
		}
		
		
		//用ID查看所有留言
		@GetMapping("/viewMsgById")
		public ModelAndView viewMsgById(ModelAndView mav, @RequestParam(name = "id") Integer id){
			mav.setViewName("record/viewById");	
			RecordMessages rMsg = new RecordMessages();
			System.out.println("rMsg = "+rMsg);
			
			RecordMessages msgById = msgService.findById(id);
			System.out.println("msgById = "+msgById);

			mav.getModel().put("recordMessage", rMsg);  //留言
			mav.getModel().put("recordMsgById", msgById);  //ID
		
			return mav;
			
		}
		
		
//--------------------------------------------------------------------------------------------------------------------------
		//修改留言(顯示之前的留言資料)
		@GetMapping("/updateMsg")
		public ModelAndView showPreviousMsg(ModelAndView mav, @RequestParam(name = "id") Integer id) {
			RecordMessages msg = msgService.findById(id);
			mav.getModel().put("recordMessage", msg);
			mav.setViewName("record/updateMsg");	
			return mav;
		}
		
		//修改留言(更新留言)
		@PostMapping("/updateMsg")
		public ModelAndView updateMsg(ModelAndView mav, @Valid @ModelAttribute(name="recordMessage") RecordMessages msg, BindingResult result) {	
			mav.setViewName("record/updateMsg");	
			if(!result.hasErrors()) {
				 msgService.insertMessage(msg);
				 mav.setViewName("redirect:/theLastestRecord");
			}	
			return mav;	
		}
		

		//刪除留言
		@GetMapping(value = "/deleteMsg")
		public ModelAndView deleteMsg(ModelAndView mav, @RequestParam(name = "id",required = false) Integer id) {
			msgService.deleteByID(id);
			mav.setViewName("redirect:/totalRecord"); // redirect到viewMessages這個Controller
			return mav;
		}
}
