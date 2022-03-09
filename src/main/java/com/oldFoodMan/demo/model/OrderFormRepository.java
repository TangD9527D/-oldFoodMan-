package com.oldFoodMan.demo.model;

import org.springframework.data.jpa.repository.JpaRepository;

public interface OrderFormRepository extends JpaRepository<OrderForm, Integer> {
	
}
