package com.oldFoodMan.demo.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface OrderFormRepository extends JpaRepository<OrderForm, Integer> {
	
	public List<OrderForm> findByOrderMemberId(int memberId);
	
	@Query(value = "declare @pageindex int= :pageindex ; declare @pagesize smallint=5;"
			+ "select * from orderform where orderMemberId = :orderMemberId order by orderNumber desc offset (@pageindex-1)*@pagesize rows fetch next @pagesize rows only;", nativeQuery = true)
	public List<OrderForm> findPage(@Param(value = "pageindex") int pageindex, @Param(value = "orderMemberId") int orderMemberId);
	
	@Query(value = "SELECT COUNT(orderMemberId) FROM orderform where orderMemberId = :orderMemberId",nativeQuery = true)
	public int findCount(@Param(value = "orderMemberId") int orderMemberId);
	
	@Query(value = "Select *from orderform where (orderTotal LIKE %:inputVal% or orderTime LIKE %:inputVal%) and orderMemberId = :orderMemberId order by orderTime desc", nativeQuery = true)
	public List<OrderForm> searchOrder(@Param(value = "inputVal") String inputVal, @Param(value = "orderMemberId") int orderMemberId);
	
}
