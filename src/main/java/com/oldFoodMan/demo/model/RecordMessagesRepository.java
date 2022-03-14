package com.oldFoodMan.demo.model;

import java.util.List;

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
	
	@Transactional
	@Modifying
	@Query(value="SELECT id,added,texts,member_id FROM record_messages WHERE record_id =? ORDER BY added DESC",nativeQuery=true)
	public void msgByIdOredrByDate(@Param("id")Integer id);
	
	@Transactional
	@Modifying
	@Query(value="SELECT*FROM record_messages M  WHERE M.record_id= :record_id ORDER BY added DESC",nativeQuery=true)
	public List<RecordMessages> MsgListByRecordId(@Param("record_id")Integer record_id);
	

}
