package com.oldFoodMan.demo.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oldFoodMan.demo.model.OrderDetail;
import com.oldFoodMan.demo.model.OrderDetailRepository;

@Service
public class OrderDetailService {
	
	@Autowired
	private OrderDetailRepository detailDao;
	 
	public void insertDetail(OrderDetail detail) {
		detailDao.save(detail);
	}
	
	public List<OrderDetail> findmyDetail(int detailNumber){
		return detailDao.findByDetailNumber(detailNumber);
	}
	
	public Integer[] findProductAmount() {
		return detailDao.findProductAmount();
	}
	
	public Integer[] findProductIdToDoNextStep(int ori, int last) {
		return detailDao.findProductIdToDoNextStep(ori, last);
	}
	
	public List<List<String>> findqqq(int ori, int last){
		return detailDao.findProductAmount2(ori, last);
	}
}
