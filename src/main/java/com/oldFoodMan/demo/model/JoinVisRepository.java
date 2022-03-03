package com.oldFoodMan.demo.model;



import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
@Repository
public interface JoinVisRepository extends JpaRepository<JoinVis, Integer> {
	
//	public OldFoodManBean findFirstByOrderByAddedDesc();
	
	public List<JoinVis> findAll();
	
	@Query(value = "Select * from shoppingcart where my_food_vis_id = :my_food_vis_id and member_id = :member_id",nativeQuery = true)
	public JoinVis findByVisIdAndMemberId(@Param(value = "my_food_vis_id")Integer my_food_vis_id, @Param(value = "member_id")Integer member_id);
	
}