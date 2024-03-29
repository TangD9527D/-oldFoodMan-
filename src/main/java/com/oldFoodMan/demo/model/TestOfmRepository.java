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
	
	
	@Query(value="select * from add_food_group join my_food_vis on my_food_vis.vis_id=add_food_group.my_food_vis_id where add_food_group.member_id = :member_id",nativeQuery=true)
	public List<TestOFM> findByMemberId(@Param(value="member_id") Integer member_id);
	
	@Query(value = "Select * from my_food_vis where member_id=:member_id",nativeQuery = true)
	public List<TestOFM> findMyFoodVisByMemberID(@Param(value = "member_id") Integer member_id);
	
	@Query(value="  select*from my_food_vis join Member on member.id=my_food_vis.member_id",nativeQuery=true)
	public List<TestOFM> findAllAndMember();
	
	@Query(value="   select  top 3 vis_res_name ,count(*) as num from my_food_vis group by vis_res_name　order by num DESC",nativeQuery=true)
	public List<String> findvisdate();
	
	@Query(value=" select count(*)as num from my_food_vis group by vis_res_name　order by vis_res_name" ,nativeQuery=true)
	public List<String> findvis();
	
	@Query(value="  select top 3 account ,member_id,count(*) as num from Member join my_food_vis on my_food_vis.member_id=member.id group by account,member_id order by num DESC",nativeQuery=true)
	public List<String> findVisMemberTop3();
}