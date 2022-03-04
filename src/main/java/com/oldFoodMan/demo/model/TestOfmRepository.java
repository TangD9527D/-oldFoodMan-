package com.oldFoodMan.demo.model;



import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
@Repository
public interface TestOfmRepository extends JpaRepository<TestOFM, Integer> {
	
//	public OldFoodManBean findFirstByOrderByAddedDesc();
	
	@Query(value = "Select vis_id,vis_res_name,added,vis_location,member_id,vis_condition,vis_date,vis_num,vis_time from my_food_vis ",nativeQuery = true)
	public List<TestOFM> findAllNoMemberID();
	
	
	
	
	
}