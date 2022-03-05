package com.oldFoodMan.demo.model;



import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
@Repository
public interface OfmRepository extends JpaRepository<OldFoodManBean, Integer> {
	
//	public OldFoodManBean findFirstByOrderByAddedDesc();
	
	@Transactional
	@Query(value = "Select vis_id,vis_res_name,added,vis_location,member_id,vis_condition,vis_date,vis_num,vis_time from my_food_vis ",nativeQuery = true)
	public List<OldFoodManBean> findAllNoMemberID();
	
	@Query(value = "Select * from my_food_vis where vis_id=:vis_id",nativeQuery = true)
	public List<OldFoodManBean> findByID(@Param(value = "vis_id") Integer vis_id);
	
	
	
}