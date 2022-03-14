package com.oldFoodMan.demo.model;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface addVisRepository extends JpaRepository<Member, Integer> {

	@Query(value="select * from member join add_food_group on add_food_group.member_id=member.id where my_food_vis_id= :my_food_vis_id",nativeQuery=true)
	public List<Member> findByMyFoodVisId(@Param(value="my_food_vis_id") Integer myfoodvisid);
	
	@Query(value="  select*from Member join my_food_vis on my_food_vis.member_id=member.id",nativeQuery=true)
	public List<Member> findAllAndMemberId();
}
