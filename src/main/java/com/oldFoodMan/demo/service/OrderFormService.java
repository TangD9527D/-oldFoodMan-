package com.oldFoodMan.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oldFoodMan.demo.model.OrderForm;
import com.oldFoodMan.demo.model.OrderFormRepository;

@Service
public class OrderFormService {
	
	@Autowired
	private OrderFormRepository oDao;
	
	public List<OrderForm> FindAllMyOrder(){
		return oDao.findAll();
	}
	
	public void insertNewOrder(OrderForm OrderForm) {
		oDao.save(OrderForm);
	}
}
