package com.oldFoodMan.demo.model.lemon;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

public interface ReviewerSaveRatingRepository extends JpaRepository<ReviewerSaveRating, Integer> {
	
	
	
	@Query(value="SELECT TOP 5 * FROM reviewer_saveRating ORDER BY gender_sum DESC",nativeQuery = true)
	public List<ReviewerSaveRating> topFiveRating();

	@Transactional
	@Modifying
	@Query(value = "INSERT INTO reviewer_saveRating (member_id,gender_avg) VALUES (:member_id,0)",nativeQuery = true)
	public void insertByMember(@Param(value = "member_id") Integer member_id);

	@Query(value = "Select * from reviewer_saveRating where member_id = :member_id",nativeQuery = true)
	public ReviewerSaveRating findByMember(@Param(value = "member_id") Integer member_id);
	
	@Query(value = "Select * from reviewer_saveRating where record_id = :record_id",nativeQuery = true)
	public ReviewerSaveRating findByRecord(@Param(value = "record_id") Integer record_id);

}
