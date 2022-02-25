package com.oldFoodMan.demo.model;



import org.springframework.data.jpa.repository.JpaRepository;

import org.springframework.stereotype.Repository;
@Repository
public interface OfmRepository extends JpaRepository<OldFoodManBean, Integer> {
	
//	public OldFoodManBean findFirstByOrderByAddedDesc();

	
	
}