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


@Service
public class OfmService {
	@Autowired
	private OfmRepository dao;

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

		List<OldFoodManBean> messages = dao.findAll();

		return messages;
	}

	public Page<OldFoodManBean> findByPage(Integer pageNumber) {
		Pageable pgb = PageRequest.of(pageNumber - 1, 5, Sort.Direction.DESC, "added");
		return dao.findAll(pgb);
	}

//	public OldFoodManBean getLastest() {
//
//		return dao.findFirstByOrderByAddedDesc();
//	}

}
