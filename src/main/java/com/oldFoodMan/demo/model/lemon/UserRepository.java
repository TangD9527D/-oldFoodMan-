package com.oldFoodMan.demo.model.lemon;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

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
}
