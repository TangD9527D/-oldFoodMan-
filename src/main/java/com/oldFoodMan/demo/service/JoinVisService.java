package com.oldFoodMan.demo.service;

import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.oldFoodMan.demo.model.JoinVis;
import com.oldFoodMan.demo.model.JoinVisRepository;
import com.oldFoodMan.demo.model.Member;
import com.oldFoodMan.demo.model.OfmRepository;
import com.oldFoodMan.demo.model.OldFoodManBean;
import com.oldFoodMan.demo.model.ShoppingCart;


@Service
public class JoinVisService {
	@Autowired
	private JoinVisRepository joinDao;
	
	private OfmRepository visDao;

	
	
	public void insert(JoinVis ofmjoin,OldFoodManBean ofmvis,Member member,HttpSession hs) {
		
		Member mid = (Member)hs.getAttribute("member");
		
		
		ofmjoin.setMember_id(mid);
		ofmjoin.setMy_food_vis_id(ofmvis);
		
		joinDao.save(ofmjoin);
		

	}
	
	public List<JoinVis> findAll(){
		return joinDao.findAll();
	}
	

}
