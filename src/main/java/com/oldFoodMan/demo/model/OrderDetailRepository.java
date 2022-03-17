package com.oldFoodMan.demo.model;

import java.util.List;
import java.util.Map;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;


public interface OrderDetailRepository extends JpaRepository<OrderDetail, Integer> {
	
	@Query(value = "select * from orderdetail where detailNumber = :detailNumber", nativeQuery = true)
	public List<OrderDetail> findByDetailNumber(@Param(value = "detailNumber") int detailNumber);
	
	@Query(value = "select SUM(detailProductAmount) from orderdetail group by detailProductId order by detailProductId", nativeQuery = true)
	public Integer[] findProductAmount();
	
	@Query(value = "select SUM(detailProductTotal),detailProductId from orderdetail where detailId between 1 and 8 group by detailProductId", nativeQuery = true)
	public Map<Integer, Integer> findProductAmount2();
	
}
