package com.oldFoodMan.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oldFoodMan.demo.model.OrderForm;
import com.oldFoodMan.demo.model.OrderFormRepository;

@Service
public class OrderFormService {
	
	@Autowired
	private OrderFormRepository orderDao;
	
	public void insertForm(OrderForm form) {
		orderDao.save(form);
	}
	
	public List<OrderForm> findByOrderMemberId(Integer memberId){
		return orderDao.findByOrderMemberId(memberId);
	}
	
	public List<OrderForm> findPage(int pageNumber, int memberId){
		return orderDao.findPage(pageNumber, memberId);
	}
	
	public int findCount(int memberId) {
		return orderDao.findCount(memberId);
	}
	
	public List<OrderForm> searchByTimeOrMoney(String inputVal, int memberId){
		return orderDao.searchOrder(inputVal, memberId);
	}
	
}
