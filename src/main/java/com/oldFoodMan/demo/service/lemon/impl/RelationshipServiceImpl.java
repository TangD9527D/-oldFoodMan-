package com.oldFoodMan.demo.service.lemon.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
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
	public List<Integer> listFriends(Integer userId) {
		List<Integer> relationshipList = relationshipRepository.findFriendsByUserId(userId);
		return relationshipList;
	}

	@Override
	public void saveRelationship(Relationship relationship) {
		//添加關注
		relationshipRepository.save(relationship);
		//更新關注數和粉絲數
//		updateFollowSize(relationship.getFromUserId());
//		updateFanSize(relationship.getToUserId());
	}

	@Override
	public void removerRelationship(Relationship relationship) {
		//刪除關係
		relationshipRepository.delete(relationship);
		//更新數量
//		updateFollowSize(relationship.getFromUserId());
//		updateFanSize(relationship.getToUserId());
	}

	@Override
	public void updateFollowSize(Integer userId) {
		User user = userRepository.findById(userId).get();
		user.setFollow_size(relationshipRepository.countByFromUserId(userId));
		userRepository.save(user);
	}

	@Override
	public void updateFanSize(Integer userId) {
		User user = userRepository.findById(userId).get();
		user.setFan_size(relationshipRepository.countByToUserId(userId));
		userRepository.save(user);
	}

	@Override
	public List<Integer> listFollows(Integer userId) {
		List<Integer>relationshipList = relationshipRepository.findByFromUserId(userId);
		return relationshipList;
	}

	@Override
	public List<Integer> listFans(Integer userId) {
		List<Integer>relationshipList = relationshipRepository.findByToUserId(userId);
		return relationshipList;
	}

}
