package com.oldFoodMan.demo.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.oldFoodMan.demo.model.Member;
import com.oldFoodMan.demo.model.OfmRepository;
import com.oldFoodMan.demo.model.OldFoodManBean;
import com.oldFoodMan.demo.model.addVisRepository;


@Service
public class OfmService {
	@Autowired
	private OfmRepository dao;

	@Autowired
	private addVisRepository addDao;
	
	public void insert(OldFoodManBean ofm) {
		dao.save(ofm);

	}
	
	public OldFoodManBean findById(Integer id) {
		Optional<OldFoodManBean> op = dao.findById(id);

		if (op.isPresent()) {
			return op.get();
		}

		return null;
	}

	public void delete(Integer id) {

		dao.deleteById(id);

	}

	public List<OldFoodManBean> findAll() {

		List<OldFoodManBean> ofmfull = dao.findAll();
		
		return ofmfull;
	}
	
	public List<OldFoodManBean> findAllAndMember() {

		List<OldFoodManBean> ofmfull = dao.findAllAndMember();
		
		return ofmfull;
	}
	
	public List<Member> findAllAndMemberId() {

		List<Member> ofmfull = addDao.findAllAndMemberId();
		
		return ofmfull;
	}

	public List<OldFoodManBean> findByID(Integer id){
		
		List<OldFoodManBean> ofmforfull=dao.findByID(id);
		return ofmforfull;
	}
	
	
	
	public Page<OldFoodManBean> findByPage(Integer pageNumber) {
		Pageable pgb = PageRequest.of(pageNumber - 1, 5, Sort.Direction.DESC, "added");
		return dao.findAll(pgb);
	}
	
//	public List<OldFoodManBean> findByMemberID(Integer id){
//		
//		List<OldFoodManBean> ofmforfull=dao.findByMemberID(id);
//		return ofmforfull;
//	}

//	public OldFoodManBean getLastest() {
//
//		return dao.findFirstByOrderByAddedDesc();
//	}

}
