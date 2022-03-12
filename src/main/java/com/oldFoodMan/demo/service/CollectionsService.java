package com.oldFoodMan.demo.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oldFoodMan.demo.model.Collections;
import com.oldFoodMan.demo.model.CollectionsRepository;
import com.oldFoodMan.demo.model.FoodRecord;
import com.oldFoodMan.demo.model.FoodRecordRepository;
import com.oldFoodMan.demo.model.Member;

@Service
public class CollectionsService {

	@Autowired
	private CollectionsRepository clotdao ;
	
	@Autowired
	private FoodRecordRepository frdao ;
	
	public void insert (FoodRecord record ,Member member) {
							
		Collections insert=new Collections();
		
		insert.setMember_id(member);
		insert.setRecord_id(record);
		
		clotdao.save(insert);
		
	}	
	
	public List<Collections> findClotById(Member member){		
		
		return clotdao.findByMemberId(member);
		
	}
	
	
	public void findByMemberIdDelete(Member member,FoodRecord record) {
		
		Integer member_id = member.getId();
		Integer	record_id = record.getId();
				
		Collections delclot=clotdao.findByMemberIdDelete(member_id, record_id);
		
		clotdao.delete(delclot);
	}
	
	public Collections findByMemberIdAndRecordId(Member member,FoodRecord record){
		
		Integer member_id=member.getId();
		Integer record_id=record.getId();
		
		Collections likeclot=clotdao.findByMemberIdAndRecordId(member_id, record_id);
		
		System.out.println("!!有啥: " +likeclot);
		
		
		if(likeclot == null) {
		System.out.println("like了啦:"+likeclot);
		Collections clot=new Collections();
		clot.setMember_id(member);
		clot.setRecord_id(record);
		clotdao.save(clot);
			
		}else {

			Collections clot=new Collections();
			clot.setMember_id(member);
			clot.setRecord_id(record);
			clotdao.delete(clot);
			
		}
		
		return likeclot ;
		
	}
	
	public List<Collections>findRecord(Member member,FoodRecord record){
		
		Integer member_id=member.getId();
		Integer record_id=record.getId();
		
		List<Collections> list= clotdao.findRecord(member_id, record_id);
		
		return list ;
		
		
	}
	
	public FoodRecord findByRecordId(Integer record) {
		
		Optional <FoodRecord> rc =frdao.findById(record);
		FoodRecord id=rc.get();
		return id ;
		
	}
	
}
