package com.oldFoodMan.demo.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface ColletRepository extends JpaRepository<FoodRecord, Integer> {

	@Query("from FoodRecord where shopType = :shopType")
	public List<FoodRecord> findByShopType(@Param(value = "shopType") String shopType);
	
	
}
