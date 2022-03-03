package com.oldFoodMan.demo.service;

import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import com.oldFoodMan.demo.model.JoinVis;
import com.oldFoodMan.demo.model.JoinVisRepository;
import com.oldFoodMan.demo.model.Member;
import com.oldFoodMan.demo.model.OfmRepository;
import com.oldFoodMan.demo.model.OldFoodManBean;
import com.oldFoodMan.demo.model.Product;



@Service
public class JoinVisService {
	@Autowired
	private JoinVisRepository joinDao;
	
	private OfmRepository visDao;
	


	public void insert(JoinVis joinvis) {
		joinDao.save(joinvis);

	}
	
	
	public void addJoinVis(JoinVis jv) {
		
		
		
		
		
		joinDao.save(jv);
		
	}
	
	public JoinVis findJoinVisByMemberID(Integer member_id) {
		Optional<JoinVis> op = joinDao.findById(member_id);
		
		if (op.isPresent()) {
			return op.get();
		}

		return null;
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
	
	public void deleteJoinVis(Integer add_id) {
		joinDao.deleteById(add_id);
	}
}
