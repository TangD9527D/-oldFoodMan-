package com.oldFoodMan.demo.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.oldFoodMan.demo.model.FoodRecord;
import com.oldFoodMan.demo.model.FoodRecordRepository;


@Service
public class OldFoodManServiceTest {
	
	@Autowired
	private FoodRecordRepository dao ;
	
	public void insert(FoodRecord title ){
		
		dao.save(title);
		
	}
	
	public FoodRecord findById(Integer id) {
		
		Optional<FoodRecord> op=dao.findById(id);
		
		if(op.isPresent()) {
			
			return op.get();
		}
		return null ;
	}
	
	public void delete(Integer id) {
		
		dao.deleteById(id);
		
	}
	
	public List<FoodRecord> findAll(){
		
		List<FoodRecord> title =dao.findAll();
		
		return title ;
		
	}
	
	public Page<FoodRecord> findByPage(Integer pageNumber){
		
		Pageable pgb =PageRequest.of(pageNumber-1, 9, Sort.Direction.DESC,"added");
		
		return dao.findAll(pgb);
		
	}
	
	
	

}
