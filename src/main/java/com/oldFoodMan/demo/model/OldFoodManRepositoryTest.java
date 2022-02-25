package com.oldFoodMan.demo.model;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface OldFoodManRepositoryTest extends JpaRepository<OldFoodManTest, Integer>{
	
	
	

}
