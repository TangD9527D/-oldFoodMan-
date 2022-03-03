package com.oldFoodMan.demo.model;



import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import org.springframework.stereotype.Repository;
@Repository
public interface JoinVisRepository extends JpaRepository<JoinVis, Integer> {
	
//	public OldFoodManBean findFirstByOrderByAddedDesc();
	
	public List<JoinVis> findAll();
	
	
}