package com.oldFoodMan.demo.model;




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


}