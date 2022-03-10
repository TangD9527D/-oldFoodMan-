package com.oldFoodMan.demo.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;


public interface OrderDetailRepository extends JpaRepository<OrderDetail, Integer> {
	
	public List<OrderDetail> findByDetailNumber(OrderForm detailNumber);
	
}
