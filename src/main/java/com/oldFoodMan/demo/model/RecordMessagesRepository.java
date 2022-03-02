package com.oldFoodMan.demo.model;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface RecordMessagesRepository extends JpaRepository<RecordMessages, Integer> {

	public RecordMessages findFirstByOrderByAddedDesc();
}
