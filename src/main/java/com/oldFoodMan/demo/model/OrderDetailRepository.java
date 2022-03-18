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
	
	@Query(value = "select SUM(detailProductTotal) , product_name\r\n"
			+ "from orderdetail join product on product.product_id = orderdetail.detailProductId \r\n"
			+ "where detailId between :ori and :last group by detailProductId, product_name", nativeQuery = true)
	public List<List<String>> findProductAmount2(@Param(value = "ori") int ori, @Param(value = "last") int last);
	
}
