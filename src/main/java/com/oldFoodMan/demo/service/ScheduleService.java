package com.oldFoodMan.demo.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.oldFoodMan.demo.model.ScheduleBean;
import com.oldFoodMan.demo.model.ScheduleRepository;



@Service
public class ScheduleService {
	
	@Autowired
	private ScheduleRepository sbdao ;
	
	public void insert (ScheduleBean sb ) {
		
		sbdao.save(sb);		
		
	}
	
	public ScheduleBean findById(Integer id) {		
		
		Optional<ScheduleBean> op=sbdao.findById(id);
		
		if(op.isPresent()) {
			
			return op.get();
		}
		return null ;
		
	}
	
	public void delete (Integer id) {
		
		sbdao.deleteById(id);		
		
	}
	
	public List<ScheduleBean> findAll(){
		
		List<ScheduleBean> location=sbdao.findAll();
		
		return location ;
		
	}
	
	public Page<ScheduleBean> findByPage(Integer pageNumber){
		
		
		Pageable pgb=PageRequest.of(pageNumber-1, 8,Sort.Direction.DESC,"location");
		
		return sbdao.findAll(pgb);
		
		
		
		
	}
	

}
