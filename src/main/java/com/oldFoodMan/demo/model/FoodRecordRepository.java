package com.oldFoodMan.demo.model;




import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public interface FoodRecordRepository extends JpaRepository<FoodRecord,Integer> {

	public FoodRecord findFirstByOrderByAddedDesc();
	
	
	@Transactional
	@Modifying
	@Query(value="SELECT * FROM foodRecord f WHERE f.member_id like CONCAT('%',:member_id,'%')",nativeQuery=true)
	public void inquire(@Param("member_id")Integer member_id);
	
	@Transactional
	@Modifying
	@Query(value="SELECT*FROM foodRecord f WHERE f.member_id= :member_id ORDER BY f.create_at DESC",nativeQuery=true)
	public List<FoodRecord> memberRecordList(@Param("member_id")Integer member_id);
	

}