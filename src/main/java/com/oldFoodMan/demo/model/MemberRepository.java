package com.oldFoodMan.demo.model;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;


@Repository
public interface MemberRepository extends JpaRepository<Member, Integer> {

	@Query("from Member where account = :account")
	public Optional <Member> findByName(@Param(value = "account") String account);
 
}
