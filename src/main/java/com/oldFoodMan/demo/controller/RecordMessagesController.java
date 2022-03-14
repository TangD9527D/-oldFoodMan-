package com.oldFoodMan.demo.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
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
			
			msgService.insertMessage(foodMsg); //存留言資料
			
			List<RecordMessages> mlbri = msgService.MsgListByRecordId(RecordId);
			System.out.println("mlbri = "+mlbri);

//			Page<RecordMessages> msg_page = msgService.findByPage(1);  // 回傳前N個資料,1表示第一頁。 會回傳一個page的物件
//			List<RecordMessages> list = msg_page.getContent();    //page物件需要用getContent()方法才能拿到List
			
			return mlbri;
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
		
		
		
//		//留言List
//		@GetMapping("/MsgListByRecordId")
//		public ModelAndView MsgListByRecordId(ModelAndView mav,HttpSession session) {
//			mav.setViewName("record/MsgListByRecordId");
//			FoodRecord recordId = (FoodRecord)session.getAttribute("sessionRecordId");
//			Integer RecordId = recordId.getId();
//			System.out.println("RecordId = "+RecordId);
//			List<RecordMessages> mlbri = msgService.MsgListByRecordId(RecordId);
//			System.out.println("mlbri = "+mlbri);
//			mav.getModel().put("mlbri", mlbri);
//			return mav;
//		}
		
		
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
		@ResponseBody  //從後端傳資料到前端AJAX
		@PostMapping("/updateMsg/{id}")
		public List<RecordMessages> updateMsg(HttpServletResponse resp,@PathVariable(name="id") Integer id) {	
			RecordMessages msgId = msgService.findById(id);
			String showBeforeText = msgId.getText();   //顯示之前的留言
			System.out.println("目前的留言 = "+showBeforeText);  //在console中顯示之前的留言
			
			Page<RecordMessages> msg_page = msgService.findByPage(1);  // 回傳前N個資料,1表示第一頁。 會回傳一個page的物件
			List<RecordMessages> list = msg_page.getContent();    //page物件需要用getContent()方法才能拿到List
			
			return list;
		}
		
		//將新的留言存入資料庫
		@ResponseBody
		@PostMapping("/saveNewMsg/{id}")
		public List<RecordMessages> updateMsg(@PathVariable(name="id") Integer id,@RequestBody RecordMessageDto editMsg, HttpSession session){
			Member member = (Member)session.getAttribute("member");     //拿Member的Id
			FoodRecord sessionRecordId = (FoodRecord)session.getAttribute("sessionRecordId"); //拿食記的Id
					
			RecordMessages saveId = msgService.findById(id);
			System.out.println("留言Id的Bean = "+saveId);
			
			String inputNewMsg = editMsg.getMsg(); //拿到新寫入的留言
			System.out.println("新寫進去的留言string = "+inputNewMsg);
			saveId.setText(inputNewMsg);
			saveId.setMember_id(member);
			System.out.println("memberId = "+member);
			saveId.setRecord_id(sessionRecordId);
			System.out.println("食記Id = "+sessionRecordId);
		
			msgService.insertMessage(saveId);
			System.out.println("新寫進去的留言bean = "+saveId);
			
			Page<RecordMessages> msg_page = msgService.findByPage(1);  // 回傳前N個資料,1表示第一頁。 會回傳一個page的物件
			List<RecordMessages> list = msg_page.getContent();    //page物件需要用getContent()方法才能拿到List
			
			return list;
			
		}

		

		//刪除留言(page)
		@ResponseBody  //從後端傳資料到前端AJAX
		@PostMapping(value = "/deleteMsg/{id}")	
		public List<RecordMessages> deleteMsg(HttpServletResponse resp,@PathVariable(name="id") Integer id) {
			msgService.deleteByID(id);
			
			Page<RecordMessages> msg_page = msgService.findByPage(1);  // 回傳前N個資料,1表示第一頁。 會回傳一個page的物件
			List<RecordMessages> list = msg_page.getContent();    //page物件需要用getContent()方法才能拿到List
			
			return list;
		}
		
		//刪除食記
		@GetMapping(value = "/deleteMsg")
		public ModelAndView deleteMsg(ModelAndView mav, @RequestParam(name = "id") Integer id) {
			msgService.deleteByID(id);
			mav.setViewName("redirect:/MsgManagement"); // redirect到viewMessages這個Controller
			return mav;
		}
		
}
