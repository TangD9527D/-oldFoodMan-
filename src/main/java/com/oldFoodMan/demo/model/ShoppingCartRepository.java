package com.oldFoodMan.demo.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface ShoppingCartRepository extends JpaRepository<ShoppingCart, ShoppingCartBoth> {

	@Query(value = "Select * from shoppingcart where productId = :productId and memberId = :memberId",nativeQuery = true)
	public ShoppingCart findByProductIdAndMemberId(@Param(value = "productId")int product_id, @Param(value = "memberId")int member_id);
	
	public List<ShoppingCart> findByMemberId(Member memberid);
	
	@Query(value = "delete from shoppingcart where productId = :productId", nativeQuery = true)
	public int deleteAllOneByProductId(@Param(value = "productId") int productId);
	

}
