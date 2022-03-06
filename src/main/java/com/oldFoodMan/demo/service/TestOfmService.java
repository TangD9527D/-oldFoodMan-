package com.oldFoodMan.demo.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.AutoConfigureOrder;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.oldFoodMan.demo.model.OfmRepository;
import com.oldFoodMan.demo.model.OldFoodManBean;
import com.oldFoodMan.demo.model.TestOFM;
import com.oldFoodMan.demo.model.TestOfmRepository;


@Service
public class TestOfmService {
	@Autowired
	private TestOfmRepository dao;

	

	public void delete(Integer id) {

		dao.deleteById(id);

	}

	public List<TestOFM> findAll() {

		List<TestOFM> messages = dao.findAll();
		
		return messages;
	}

	public List<TestOFM> findAllNoMemberID(){
		
		List<TestOFM> ofmforfull=dao.findAllNoMemberID();
		return ofmforfull;
	}
	
	
	public Page<TestOFM> findByPage(Integer pageNumber) {
		Pageable pgb = PageRequest.of(pageNumber - 1, 5, Sort.Direction.DESC, "added");
		return dao.findAll(pgb);
	}

	public List<TestOFM> findByMemberID(Integer id){
		
		List<TestOFM> ofmforfull=dao.findByMemberId(id);
		return ofmforfull;
	}

}
