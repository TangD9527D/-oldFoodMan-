package com.oldFoodMan.demo.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;


public interface OrderDetailRepository extends JpaRepository<OrderDetail, Integer> {
	
	@Query(value = "select * from orderdetail where detailNumber = :detailNumber", nativeQuery = true)
	public List<OrderDetail> findByDetailNumber(@Param(value = "detailNumber") int detailNumber);
	
}
