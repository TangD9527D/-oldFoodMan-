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
import com.oldFoodMan.demo.model.FoodRecordRepository;


@Service
public class FoodRecordService {

	@Autowired
	private FoodRecordRepository frDao;

	
	//新增
	public void insertRF(FoodRecord rf) {   
		frDao.save(rf);
	}
	
	
	//用ID查 方法一 (Optional→使用泛型)
		public FoodRecord findById(Integer id) {  
			Optional<FoodRecord> op = frDao.findById(id);        // 回傳Optional的物件(不能直接回傳)

			if (op.isPresent()) {                   // 透過Optional判斷是否有(存在)
				return op.get();// 
			}
			return null;              //如果沒有，則回傳null
		}
	
		public FoodRecord getLastest() {
			return frDao.findFirstByOrderByAddedDesc();
		}
	

//	//用ID查 方法二(Optional→強制轉型的方式)
//	public FoodRecord findById(Integer id) {  
//		Optional op = frDao.findById(id);        // 回傳Optional的物件(不能直接回傳)
//
//		if (op.isPresent()) {                   // 透過Optional判斷是否有(存在)
//			return (FoodRecord) op.get();// 如果有的話就回傳回來。如果前面Optional沒有使用泛型，這邊的op前面就必須強制轉型。因為這邊呼叫op時，它會不知道要回傳什麼型別
//		}
//		return null;              //如果沒有，則回傳null
//	}

	
	//查全部
	public List<FoodRecord>  findAllRecord() {
		List<FoodRecord> record = frDao.findAll();
		return record;
	}
	
	
	//用id刪除
	public void deleteByID(Integer id) {
		frDao.deleteById(id);
	}
	
	//分頁
	public Page<FoodRecord> findByPage(Integer pageNumber) {
		Pageable pgb= PageRequest.of(pageNumber-1, 5, Sort.Direction.DESC, "added");
		return frDao.findAll(pgb);
		
	}
	
	//模糊搜尋
	public void fuzzySearch(Integer member_id) {
		frDao.inquire(member_id);
	}

	
}
