package com.oldFoodMan.demo.model;



import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
@Repository
public interface JoinVisRepository extends JpaRepository<JoinVis, JoinVisBoth> {
	
//	public OldFoodManBean findFirstByOrderByAddedDesc();
	
	@Query(value="select * from add_food_group join my_food_vis on my_food_vis.vis_id=add_food_group.my_food_vis_id where add_food_group.member_id = :member_id",nativeQuery=true)
	public List<JoinVis> findByMemberId(@Param(value="member_id") Integer member_id);
	
	@Query(value="select * from add_food_group where my_food_vis_id=:my_food_vis_id",nativeQuery=true)
	public JoinVis findBymyfoodvisid(@Param(value="my_food_vis_id") Integer my_food_vis_id);

	@Transactional
	@Modifying
	@Query(value="delete from add_food_group where member_id=:member_id and my_food_vis_id=:my_food_vis_id",nativeQuery=true)
	public void deleteByMemberIdAndVisId(@Param(value="member_id") Integer member_id,@Param(value="my_food_vis_id") Integer my_food_vis_id);


	

}