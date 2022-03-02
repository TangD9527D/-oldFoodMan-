package com.oldFoodMan.demo.controller;

import java.util.List;

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
import com.oldFoodMan.demo.model.RecordMessages;
import com.oldFoodMan.demo.service.RecordMessageService;



@Controller
public class RecordMessagesController {
	
	@Autowired
	private RecordMessageService msgService;
	
	
	//新增Msg
	@PostMapping(value = "/createMsg")
	public ModelAndView postNewData(ModelAndView mav, @Valid @ModelAttribute(name = "msg") RecordMessages rMsg,BindingResult rs) {
		msgService.insertMessage(rMsg);
		mav.setViewName("redirect:/theLastestRecord");   //回傳到PageController的record/totalRecord的頁面
		return mav;
	}
	
	
	//api
		@ResponseBody   //因為是要回傳json所以要用@ResopnseBody (ModelAndView 是回傳一個View)
		@PostMapping("/api/postMessage")	
		public List<RecordMessages> postMessageApi(@RequestBody RecordMessageDto dto){  //@RequestBody RecordMessageDto 請求的本體(送進來的) ；List<RecordMessages>回傳回去的
			String text = dto.getMsg();     //從dto拿到值，這是一個String的text
			
			RecordMessages foodMsg = new RecordMessages();   //因為是新增資料，所以需要new
			foodMsg.setText(text);    //然後把text送給foodMsg
			
			msgService.insertMessage(foodMsg);   //將資料存進去
			
			Page<RecordMessages> msg_page = msgService.findByPage(1);  // 回傳前N個資料,1表示第一頁。 會回傳一個page的物件
			List<RecordMessages> list = msg_page.getContent();    //page物件需要用getContent()方法才能拿到List
			
			return list;
		
		}
		
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