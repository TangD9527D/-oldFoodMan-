package com.oldFoodMan.demo.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

public interface OrderFormRepository extends JpaRepository<OrderForm, Integer> {
	
	public List<OrderForm> findByOrderMemberId(int memberId);
}
