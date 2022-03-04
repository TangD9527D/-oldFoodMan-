package com.oldFoodMan.demo.model;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public interface RecordMessagesRepository extends JpaRepository<RecordMessages, Integer> {

	public RecordMessages findFirstByOrderByAddedDesc();
	
	@Transactional
	@Modifying
	@Query(value="UPDATE record_messages SET member_id=?, record_id=?WHERE id=?",nativeQuery=true)
	public void updateMemberID_recordID(@Param("id") Integer id,@Param("member_id") Member member_id, @Param("record_id") FoodRecord record_id);
}
