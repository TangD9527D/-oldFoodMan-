package com.oldFoodMan.demo.model;



import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
@Repository
public interface JoinVisRepository extends JpaRepository<JoinVis, JoinVisBoth> {
	
//	public OldFoodManBean findFirstByOrderByAddedDesc();
	
	@Query(value="select * from add_food_group where member_id = :member_id",nativeQuery=true)
	public List<JoinVis> findByMemberId(@Param(value="member_id") Integer member_id);
	
	
	
	
}