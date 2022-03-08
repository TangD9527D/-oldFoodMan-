package com.oldFoodMan.demo.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface ColletRepository extends JpaRepository<FoodRecord, Integer> {
																//=?
	@Query(value="select * from FoodRecord where shopType like %:shopType% or title like %:shopType% or content like %:shopType% or shopName like %:shopType% or city like %:shopType% or tag like %:shopType% ",nativeQuery = true)
	public List<FoodRecord> findByShopType(@Param(value = "shopType") String shopType);
	
	
	
	
//	String SQL = "Select * from location where location like '%"+search+"%' or ename like '%" +search+


//			"%' or email like '%"+search+"%'"  ;	
//	
//	
//	@Query(value="select*from my_food_vis where vis_location like % :search % or vis_res_name like % :search %",nativeQuery=true)
//	public List<JoinVis> search(@Param(value="search") String search);

//			"%' or email like '%"+search+"%'"  ;	 like %:shopType% or title like  %:shopType% or content like  %:shopType% or shopName like  %:shopType% or city like  %:shopType%
		


}
