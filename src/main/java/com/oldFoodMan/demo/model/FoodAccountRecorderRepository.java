package com.oldFoodMan.demo.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface FoodAccountRecorderRepository extends JpaRepository<FoodAccountRecorder, Integer> {
	
	
	public List<FoodAccountRecorder> findAll();
	
}
