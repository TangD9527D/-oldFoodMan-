package com.oldFoodMan.demo.service.lemon.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.oldFoodMan.demo.model.lemon.Relationship;
import com.oldFoodMan.demo.model.lemon.RelationshipRepository;
import com.oldFoodMan.demo.model.lemon.User;
import com.oldFoodMan.demo.model.lemon.UserRepository;
import com.oldFoodMan.demo.service.lemon.RelationshipService;

@Service
public class RelationshipServiceImpl implements RelationshipService {

	@Autowired
	private RelationshipRepository relationshipRepository;
	
	@Autowired
	private UserRepository userRepository;
	
	@Override
	public Page<User> listFollows(Integer userId, Pageable pageable) {
		List<Integer> relationshipList = relationshipRepository.findByFromUserId(userId);
		Page<User> userPage = userRepository.findByIdIn(relationshipList, pageable);
		return userPage;
	}

	@Override
	public Page<User> listFans(Integer userId, Pageable pageable) {
		List<Integer>relationshipList = relationshipRepository.findByToUserId(userId);
		Page<User>userPage=userRepository.findByIdIn(relationshipList, pageable);
		return userPage;
	}

	@Override
	public List<Integer> listFriends(Integer userId) {
		List<Integer> relationshipList = relationshipRepository.findFriendsByUserId(userId);
		return relationshipList;
	}

	@Override
	public void saveRelationship(Relationship relationship) {
		//添加關注
		relationshipRepository.save(relationship);
		//更新關注數和粉絲數
		updateFollowSize(relationship.getFromUserId());
		updateFanSize(relationship.getToUserId());
	}

	@Override
	public void removerRelationship(Relationship relationship) {
		//刪除關係
		relationshipRepository.delete(relationship);
		//更新數量
		updateFollowSize(relationship.getFromUserId());
		updateFanSize(relationship.getToUserId());
	}

	@Override
	public void updateFollowSize(Integer userId) {
		User user = userRepository.findById(userId).get();
		user.setFollowSize(relationshipRepository.countByFromUserId(userId));
		userRepository.save(user);
	}

	@Override
	public void updateFanSize(Integer userId) {
		User user = userRepository.findById(userId).get();
		user.setFanSize(relationshipRepository.countByToUserId(userId));
		userRepository.save(user);
	}

}
