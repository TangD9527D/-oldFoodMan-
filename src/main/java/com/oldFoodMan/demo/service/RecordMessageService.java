package com.oldFoodMan.demo.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.oldFoodMan.demo.model.FoodRecord;
import com.oldFoodMan.demo.model.Member;
import com.oldFoodMan.demo.model.RecordMessages;
import com.oldFoodMan.demo.model.RecordMessagesRepository;




@Service
public class RecordMessageService {

	@Autowired
	private RecordMessagesRepository dao;

	
	//新增
	public void insertMessage(RecordMessages fMsg) {   
		dao.save(fMsg);
	}
	
	
	//用ID查 方法一 (Optional→使用泛型)
		public RecordMessages findById(Integer id) {  
			Optional<RecordMessages> op = dao.findById(id);        // 回傳Optional的物件(不能直接回傳)

			if (op.isPresent()) {                   // 透過Optional判斷是否有(存在)
				return op.get();// 
			}
			return null;              //如果沒有，則回傳null
		}
	
		public RecordMessages getLastest() {
			return dao.findFirstByOrderByAddedDesc();
		}
		
	//update留言的會員ID&食記ID
	public void updateId(Integer id,Member member_id,FoodRecord record_id) {
		dao.updateMemberID_recordID(id,member_id,record_id);
	}

	
	//查全部
	public List<RecordMessages>  findAllMsg() {
		List<RecordMessages> record = dao.findAll();
		return record;
	}
	

	
	
	//用id刪除
	public void deleteByID(Integer id) {
		 dao.deleteById(id);
	}
	
	//分頁
	public Page<RecordMessages> findByPage(Integer pageNumberMsg) {
		Pageable pgb= PageRequest.of(pageNumberMsg-1, 5, Sort.Direction.DESC, "added");
		return dao.findAll(pgb);
		
	}

	
}
