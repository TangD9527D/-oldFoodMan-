package com.oldFoodMan.demo.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oldFoodMan.demo.model.Member;
import com.oldFoodMan.demo.model.MemberRepository;

@Service
public class MemberService {

	@Autowired
	private MemberRepository dao;
	
	public void insert(Member member) {
		dao.save(member);
	}
	
	public Member findById(Integer id) {
		Optional<Member> op = dao.findById(id);
		
		if(op.isPresent()) {
			return op.get();
		}
		
		return null;
	}
	
	
	public void delete(Integer id) {
		dao.deleteById(id);
	}
	
}
