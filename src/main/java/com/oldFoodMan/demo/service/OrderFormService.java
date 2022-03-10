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
	
	
	
}
