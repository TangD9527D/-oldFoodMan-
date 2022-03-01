package com.oldFoodMan.demo.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.oldFoodMan.demo.model.OldFoodManRepositoryTest;
import com.oldFoodMan.demo.model.OldFoodManTest;


@Service
public class OldFoodManServiceTest {
	
	@Autowired
	private OldFoodManRepositoryTest dao ;
	
	public void insert(OldFoodManTest title ){
		
		dao.save(title);
		
	}
	
	public OldFoodManTest findById(Integer id) {
		
		Optional<OldFoodManTest> op=dao.findById(id);
		
		if(op.isPresent()) {
			
			return op.get();
		}
		return null ;
	}
	
	public void delete(int id) {
		
		dao.deleteById(id);
		
	}
	
	public List<OldFoodManTest> findAll(){
		
		List<OldFoodManTest> title =dao.findAll();
		
		return title ;
		
	}
	
	public Page<OldFoodManTest> findByPage(Integer pageNumber){
		
		Pageable pgb =PageRequest.of(pageNumber-1, 6, Sort.Direction.DESC,"title");
		
		return dao.findAll(pgb);
		
	}
	
	

}
