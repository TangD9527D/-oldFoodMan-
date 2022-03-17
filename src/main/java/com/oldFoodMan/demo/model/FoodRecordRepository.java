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
	
	
	@Query(value="SELECT　shopType as 類型, COUNT(*) AS 次數 FROM foodRecord　GROUP BY shopType ORDER BY COUNT(*) DESC",nativeQuery=true)
	public List<String> typeFilter();
	
	
	//Lemon_START
	@Transactional
	@Modifying
	@Query(value="SELECT*FROM foodRecord WHERE record_id= :record_id",nativeQuery=true)
	public FoodRecord recordIdRecord(@Param("record_id")Integer record_id);
	
	@Query(value="select count( * ) as cc from foodRecord where :member_id=member_id",nativeQuery=true)
	public Integer recordCounts(@Param("member_id")Integer member_id);
	
	@Query(value="select * from foodRecord where :member_id=member_id AND gender2 >= 4",nativeQuery=true)
	public List<FoodRecord> recordFavorite(@Param("member_id")Integer member_id);
	
	@Query(value="select count( * ) as cc from foodRecord where :member_id=member_id AND gender2 >= 4",nativeQuery=true)
	public Integer recordFavCounts(@Param("member_id")Integer member_id);
	
	@Query(value=" select * from foodRecord where :city = city AND member_id=:member_id",nativeQuery=true)
	public List<FoodRecord> recordCitySort(@Param("city")String opt,@Param("member_id")Integer member_id);
	
	@Query(value="SELECT COUNT(uploadPicture) FROM foodRecord WHERE member_id=:member_id",nativeQuery=true)
	public Integer picCounts(@Param("member_id")Integer member_id);
	
	@Query(value="SELECT COUNT(city) as 台北市 FROM foodRecord where city='臺北市'AND member_id=:member_id",nativeQuery=true)
	public Integer taipeiCounts(@Param("member_id")Integer member_id);
	//lemon_END
	
}