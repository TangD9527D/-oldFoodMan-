package com.oldFoodMan.demo.service.lemon.impl;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oldFoodMan.demo.model.Member;
import com.oldFoodMan.demo.model.lemon.Relationship;
import com.oldFoodMan.demo.model.lemon.RelationshipRepository;
import com.oldFoodMan.demo.model.lemon.User;
import com.oldFoodMan.demo.model.lemon.UserRepository;
import com.oldFoodMan.demo.service.MemberServiceImpl;
import com.oldFoodMan.demo.service.lemon.RelationshipService;

@Service
public class RelationshipServiceImpl implements RelationshipService {

	@Autowired
	private RelationshipRepository relationshipRepository;
	
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private MemberServiceImpl memberService;

	@Override
	public List<Integer> listFriends(Integer userId) {
		List<Integer> relationshipList = relationshipRepository.findFriendsByUserId(userId);
		return relationshipList;
	}

	@Override
	public void saveRelationship(Relationship relationship) {
		//添加關注
		relationshipRepository.save(relationship);
	}

	@Override
	public void removerRelationship(Relationship relationship) {
		//刪除關係
		relationshipRepository.delete(relationship);
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
	public List<Member> listFollows(Integer userId) {
		List<Integer>relationshipList = relationshipRepository.findByFromUserId(userId);
		List<Member> memberList = new ArrayList<>();
		Iterator<Integer> it = relationshipList.iterator();    //使用Iterator取值
		while(it.hasNext()){
        Member member = memberService.findById((Integer) it.next());
        memberList.add(member);
        }
		
		return memberList;
	}

	@Override
	public List<Member> listFans(Integer userId) {
		List<Integer>relationshipList = relationshipRepository.findByToUserId(userId);
		List<Member> memberList = new ArrayList<>();
		Iterator<Integer> it = relationshipList.iterator();    //使用Iterator取值
		while(it.hasNext()){
        Member member = memberService.findById((Integer) it.next());
        memberList.add(member);
        }
		
		return memberList;
	}

}
