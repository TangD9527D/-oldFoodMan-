package com.oldFoodMan.demo.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface ShoppingCartRepository extends JpaRepository<ShoppingCart, Integer> {

	@Query(value = "Select * from shoppingcart where product_id = :product_id and member_id = :member_id",nativeQuery = true)
	public ShoppingCart findByProductIdAndMemberId(@Param(value = "product_id")int product_id, @Param(value = "member_id")int member_id);

}
