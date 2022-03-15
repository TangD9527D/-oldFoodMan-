package com.oldFoodMan.demo.model.lemon;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface RelationshipRepository extends JpaRepository<Relationship, RelationshipPK> {
	/*
	 * 根據關注者ID查詢所有紀錄(找關注的人的ID
	 * @param fromUserId
	 * @return
	 */
	@Query(value="select to_user_id from reviewer_relationship where from_user_id=:fromUserId",nativeQuery = true)
	List<Integer> findByFromUserId(@Param("fromUserId")Integer fromUserId);
	
	/*
	 * 根據被關注者查詢(找粉絲的ID
	 * @param toUser
	 * @return
	 */
	@Query("select fromUserId from Relationship where toUserId=:toUserId")
	List<Integer>findByToUserId(@Param("toUserId")Integer toUserId);
	
	/*
	 * 查詢互相關注ID
	 * @param userId
	 * @return
	 */
	@Query(value = "SELECT DISTINCT t1.from_user_id FROM (SELECT * FROM relationship WHERE to_user_id = ?1)  AS t1 INNER JOIN relationship t2 ON t1.from_user_id = t2.to_user_id", nativeQuery = true)
    List<Integer> findFriendsByUserId(Integer userId);
	
	/*
	 * 查詢關注數
	 * @param fromUserId
	 * @return
	 * 
	 */
	Integer countByFromUserId(Integer fromUserId);
	
	/*
	 * 查詢粉絲數
	 * @param toUserId
	 * @return
	 */
	Integer countByToUserId(Integer toUserId);
	
	
}
