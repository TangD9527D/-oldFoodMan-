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
	
	@Query(value="UPDATE foodRecord SET title=:title,content=:content,shopName=:shopName,shopType=:shopType,audience=:audience,priceScope=:priceScope,city=:city,town=:town,shopAddress=:shopAddress,tel=:tel,"
			+ "businessHours=:businessHours,tasty=:tasty,atmosphere=:atmosphere,cp=:cp,gender=:gender,gender1=:gender1,gender2=:gender2,member_id=:member_id WHERE record_id=:record_id",nativeQuery=true)
	public List<FoodRecord> updateRecord(@Param("record_id")Integer record_id);
	
	
	
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
	
	//star5

	@Query(value="SELECT COUNT(gender) AS star FROM foodRecord  WHERE gender=5 AND member_id=:member_id",nativeQuery=true)
	public Integer star5CountsG0(@Param("member_id")Integer member_id);
	
	@Query(value="SELECT COUNT(gender1) AS star FROM foodRecord  WHERE gender1=5 AND member_id=:member_id",nativeQuery=true)
	public Integer star5CountsG1(@Param("member_id")Integer member_id);
	
	@Query(value="SELECT COUNT(gender2) AS star FROM foodRecord  WHERE gender2=5 AND member_id=:member_id",nativeQuery=true)
	public Integer star5CountsG2(@Param("member_id")Integer member_id);
	
	//star4
	@Query(value="SELECT COUNT(gender) AS star FROM foodRecord  WHERE gender=4 AND member_id=:member_id",nativeQuery=true)
	public Integer star4CountsG0(@Param("member_id")Integer member_id);
	
	@Query(value="SELECT COUNT(gender1) AS star FROM foodRecord  WHERE gender1=4 AND member_id=:member_id",nativeQuery=true)
	public Integer star4CountsG1(@Param("member_id")Integer member_id);
	
	@Query(value="SELECT COUNT(gender2) AS star FROM foodRecord  WHERE gender2=4 AND member_id=:member_id",nativeQuery=true)
	public Integer star4CountsG2(@Param("member_id")Integer member_id);
	
	//star3
	@Query(value="SELECT COUNT(gender) AS star FROM foodRecord  WHERE gender=3 AND member_id=:member_id",nativeQuery=true)
	public Integer star3CountsG0(@Param("member_id")Integer member_id);
	
	@Query(value="SELECT COUNT(gender1) AS star FROM foodRecord  WHERE gender1=3 AND member_id=:member_id",nativeQuery=true)
	public Integer star3CountsG1(@Param("member_id")Integer member_id);
	
	@Query(value="SELECT COUNT(gender2) AS star FROM foodRecord  WHERE gender2=3 AND member_id=:member_id",nativeQuery=true)
	public Integer star3CountsG2(@Param("member_id")Integer member_id);
	
	//star2
	@Query(value="SELECT COUNT(gender) AS star FROM foodRecord  WHERE gender=2 AND member_id=:member_id",nativeQuery=true)
	public Integer star2CountsG0(@Param("member_id")Integer member_id);
	
	@Query(value="SELECT COUNT(gender1) AS star FROM foodRecord  WHERE gender1=2 AND member_id=:member_id",nativeQuery=true)
	public Integer star2CountsG1(@Param("member_id")Integer member_id);
	
	@Query(value="SELECT COUNT(gender2) AS star FROM foodRecord  WHERE gender2=2 AND member_id=:member_id",nativeQuery=true)
	public Integer star2CountsG2(@Param("member_id")Integer member_id);
	
	//star1
	@Query(value="SELECT COUNT(gender) AS star FROM foodRecord  WHERE gender=1 AND member_id=:member_id",nativeQuery=true)
	public Integer star1CountsG0(@Param("member_id")Integer member_id);
	
	@Query(value="SELECT COUNT(gender1) AS star FROM foodRecord  WHERE gender1=1 AND member_id=:member_id",nativeQuery=true)
	public Integer star1CountsG1(@Param("member_id")Integer member_id);
	
	@Query(value="SELECT COUNT(gender2) AS star FROM foodRecord  WHERE gender2=1 AND member_id=:member_id",nativeQuery=true)
	public Integer star1CountsG2(@Param("member_id")Integer member_id);
	
	//price1
	@Query(value="SELECT COUNT(priceScope) FROM foodRecord WHERE priceScope LIKE '%500%' AND member_id=:member_id",nativeQuery=true)
	public Integer price1Counts(@Param("member_id")Integer member_id);
	
	//price2
	@Query(value="SELECT COUNT(priceScope) FROM foodRecord WHERE priceScope LIKE '%1000%' AND member_id=:member_id",nativeQuery=true)
	public Integer price2Counts(@Param("member_id")Integer member_id);
	
	//price3
	@Query(value="SELECT COUNT(priceScope) FROM foodRecord WHERE priceScope LIKE '%3000%' AND member_id=:member_id",nativeQuery=true)
	public Integer price3Counts(@Param("member_id")Integer member_id);
	
	//price4
	@Query(value="SELECT COUNT(priceScope) FROM foodRecord WHERE priceScope LIKE '%$$$$%' AND member_id=:member_id",nativeQuery=true)
	public Integer price4Counts(@Param("member_id")Integer member_id);
	
	//SortCity
	@Query(value="SELECT * FROM foodRecord where city='臺北市' AND member_id=:member_id",nativeQuery=true)
	public List<FoodRecord> recordcity1(@Param("member_id")Integer member_id);
	
	@Query(value="SELECT * FROM foodRecord where city='花蓮縣' AND member_id=:member_id",nativeQuery=true)
	public List<FoodRecord> recordcity15(@Param("member_id")Integer member_id);
	
	//CountCity
	@Query(value="SELECT COUNT(city) FROM foodRecord where city='臺北市'AND member_id=:member_id",nativeQuery=true)
	public Integer countcity1(@Param("member_id")Integer member_id);
	
	@Query(value="SELECT COUNT(city) FROM foodRecord where city='花蓮縣'AND member_id=:member_id",nativeQuery=true)
	public Integer countcity15(@Param("member_id")Integer member_id);
	
	//SortType
	@Query(value="SELECT * FROM foodRecord where shopType='火鍋' AND member_id=:member_id",nativeQuery=true)
	public List<FoodRecord> recordtype1(@Param("member_id")Integer member_id);
	
	//CountCity
	@Query(value="SELECT COUNT(city) FROM foodRecord where shopType='火鍋' AND member_id=:member_id",nativeQuery=true)
	public Integer counttype1(@Param("member_id")Integer member_id);
	
	//SortPrice
	@Query(value=" SELECT * FROM foodRecord WHERE priceScope LIKE '%500%' AND member_id=member_id",nativeQuery=true)
	public List<FoodRecord> recordprice11(@Param("member_id")Integer member_id);
	
	@Query(value="   SELECT * FROM foodRecord WHERE priceScope LIKE '%500%' OR priceScope LIKE '%1000%' AND member_id=:member_id",nativeQuery=true)
	public List<FoodRecord> recordprice12(@Param("member_id")Integer member_id);
	
	//CountPrice
	@Query(value=" SELECT COUNT(priceScope) FROM foodRecord WHERE priceScope LIKE '%500%' AND member_id=:member_id",nativeQuery=true)
	public Integer countprice11(@Param("member_id")Integer member_id);
	
	@Query(value="  SELECT COUNT(*) FROM foodRecord WHERE priceScope LIKE '%500%' OR priceScope LIKE '%1000%' AND member_id=:member_id",nativeQuery=true)
	public Integer countprice12(@Param("member_id")Integer member_id);
	
	//lemon_END
	
}