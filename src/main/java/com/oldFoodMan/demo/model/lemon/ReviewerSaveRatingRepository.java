package com.oldFoodMan.demo.model.lemon;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

public interface ReviewerSaveRatingRepository extends JpaRepository<ReviewerSaveRating, Integer> {
	
	@Transactional
	@Modifying
	@Query(value=" INSERT INTO reviewer_saveRating (recordId,gender,gender1,gender2,gendersum)VALUES(:recordId,:gender,:gender1,:gender2,:gendersum)",nativeQuery = true)
	public void insertRating(@Param("recordId") Integer id,@Param("gender") Integer gender,@Param("gender") Integer gender1,@Param("gender") Integer gender2,@Param("gender") Integer gendersum);
	
	@Query(value="SELECT TOP 5 * FROM reviewer_saveRating ORDER BY gendersum DESC",nativeQuery = true)
	public List<ReviewerSaveRating> topFiveRating();

}
