package com.oldFoodMan.demo.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface ScheduleRepository extends JpaRepository<ScheduleBean, Integer> {

	
	@Query(value="select * from schedule where member_id = :member_id ",nativeQuery = true)
	public List<ScheduleBean> findByIdlike(@Param(value="member_id")Integer member_id);
	
		
}
