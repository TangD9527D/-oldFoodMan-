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



@Service
public class JoinVisService {
	
	@Autowired
	private JoinVisRepository joinDao;
	
	@Autowired
	private OfmRepository visDao;
	


	public void insert(JoinVis joinvis) {
		joinDao.save(joinvis);

	}
	
	
	public void addJoinVis(JoinVis joincon) {


		JoinVis jovis = new JoinVis();
		
		jovis.setMember_id(joincon.getMember_id());
		jovis.setMy_food_vis_id(joincon.getMy_food_vis_id());
		jovis.setAdd_condition(joincon.getAdd_condition());
		System.out.println("service: "+joincon);
		joinDao.save(jovis);
		
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
	
	public void deleteJoinVis(Integer member) {
//		return joinDao.deleteById(member);
	}
}