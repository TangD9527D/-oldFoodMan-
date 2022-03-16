package com.oldFoodMan.demo.model.lemon;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.oldFoodMan.demo.model.FoodRecord;

public interface ReviewerFoodRecordRepository extends JpaRepository<FoodRecord,Integer> {
	
	@Query(value="select * from reviewer_setting where member_id=:id",nativeQuery = true)
	public List<FoodRecord> foodRecordByMember(@Param(value="id") Integer id);
	
}
