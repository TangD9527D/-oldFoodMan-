package com.oldFoodMan.demo.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;


@Repository
public interface CollectionsRepository extends JpaRepository<Collections, CollectionsBoth> {
	
	
	@Query(value = "Select * from collections where member_id = :member_id",nativeQuery = true)
	public List<Collections> findByMemberId(@Param(value = "member_id") Member member_id);
	
	
	
	@Query(value = "Select * from collections where member_id = :member_id and record_id = :record_id ",nativeQuery = true)
	public Collections findByMemberIdDelete(@Param(value = "member_id")Integer member_id,@Param(value = "record_id")Integer record_id);
		
		
	@Query(value = "Select * from collections where member_id = :member_id and record_id = :record_id ",nativeQuery = true)
	public List<Collections> findByMemberIdAndRecordId(@Param(value = "member_id")Integer member_id,@Param(value = "record_id")Integer record_id);
			
		
	
	
	
	

}
