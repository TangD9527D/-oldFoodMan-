package com.oldFoodMan.demo.service;

import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import com.oldFoodMan.demo.model.JoinVis;
import com.oldFoodMan.demo.model.JoinVisBoth;
import com.oldFoodMan.demo.model.JoinVisRepository;
import com.oldFoodMan.demo.model.Member;
import com.oldFoodMan.demo.model.OfmRepository;
import com.oldFoodMan.demo.model.OldFoodManBean;
import com.oldFoodMan.demo.model.Product;
import com.oldFoodMan.demo.model.addVisRepository;



@Service
public class JoinVisService {
	
	@Autowired
	private JoinVisRepository joinDao;
	
	@Autowired
	private OfmRepository visDao;
	
	@Autowired
	private addVisRepository addDao;

	public void insert(JoinVis joinvis) {
		System.out.println("有什麼:" + joinvis);
		
		joinDao.save(joinvis);

	}
	
	
	public void addJoinVis(JoinVis joincon,Member member,OldFoodManBean ofm) {
		String condition=joincon.getAdd_condition();
		Integer member_id=member.getId();
		Integer vis_id=ofm.getVis_id();
		
		
		JoinVis join=new JoinVis();
		
		
		join.setAdd_condition(condition);
		join.setMember_id(member_id);
		join.setMy_food_vis_id(vis_id);
		
		
		System.out.println("service: "+join);
		
		joinDao.save(join);
		
	}
	
	
	public List<JoinVis> findJoinVisByMemberID(Integer member) {
		
		
		
		List<JoinVis> joinvis=joinDao.findByMemberId(member);
		
		
		return joinvis;
		
		
		
	}
	
	public OldFoodManBean findJoinVisByVisID(Integer vis_id) {
		Optional<OldFoodManBean> opv = visDao.findById(vis_id);
		
		if (opv.isPresent()) {
			return opv.get();
		}

		return null;
	}
	
	public List<JoinVis> findAll(){
		return joinDao.findAll();
	}
	
	public void deleteJoinVis(Integer member,Integer vis_id) {
		 joinDao.deleteByMemberIdAndVisId(member,vis_id);
		
	}
	
	public List<Member> findByMyFoodVisId(Integer myfoodvisid){
		return addDao.findByMyFoodVisId(myfoodvisid);
	}
	
	
	
	
	
	
}