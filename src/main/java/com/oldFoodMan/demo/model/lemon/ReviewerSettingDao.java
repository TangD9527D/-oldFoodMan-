package com.oldFoodMan.demo.model.lemon;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;



@Repository
public interface ReviewerSettingDao extends JpaRepository<ReviewerSetting , Integer> {
	
}
