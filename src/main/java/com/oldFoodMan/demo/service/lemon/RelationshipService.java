package com.oldFoodMan.demo.service.lemon;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.oldFoodMan.demo.model.lemon.Relationship;
import com.oldFoodMan.demo.model.lemon.User;

public interface RelationshipService {
	/*
	 * 列出所有關注
	 * @return
	 */
	Page<User> listFollows(Integer userId,Pageable pageable);
	
	/*
	 * 列出所有粉絲
	 * @return
	 */
	Page<User>listFans(Integer userId, Pageable pageable);
	
	/*
	 * 互相關注id
	 * @param userId
	 * @return
	 */
	List<Integer> listFriends(Integer userId);
	
	/*
	 * 添加關係
	 * @Param relationship
	 */
	void saveRelationship(Relationship relationship);
	
	/*
	 * 去除關係
	 * @Param relationship
	 */
	void removerRelationship(Relationship relationship);
	
	/*
	 * 更新關注數量
	 */
	void updateFollowSize(Integer userId);
	
	/*
	 * 更新粉絲數量
	 */
	void updateFanSize(Integer userId);
	
	
}
