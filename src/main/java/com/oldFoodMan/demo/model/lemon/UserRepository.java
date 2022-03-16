package com.oldFoodMan.demo.model.lemon;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import com.oldFoodMan.demo.model.Collections;
import com.oldFoodMan.demo.model.Member;

public interface UserRepository extends JpaRepository<User, Integer> {

	/*
	 * 根據ID集合查詢用戶分頁查詢
	 * @param ids
	 * @return
	 */
	Page<User> findByIdIn(List<Integer>ids,Pageable pageable);
	
	/*
	 * 根據ID集合查詢 不分頁
	 * @param ids
	 * @return
	 */
	List<User> findByIdIn(List<Integer>ids);
	
	@Query(value = "Select * from reviewer_user where member_id = :member_id",nativeQuery = true)
	public User findByMember(@Param(value = "member_id") Integer member_id);
	
	
	@Transactional
	@Modifying
	@Query(value = "INSERT INTO reviewer_user VALUES (:member_id,0,0,0)",nativeQuery = true)
	public User insertByMember(@Param(value = "member_id") Integer member_id);
}
