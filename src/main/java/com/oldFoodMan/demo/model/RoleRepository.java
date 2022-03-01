package com.oldFoodMan.demo.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface RoleRepository extends JpaRepository<Role, Integer> {

	@Query(value = "Select Role_Name from User_Role , App_Role where "
			+ "App_Role.Role_Id = User_Role.Role_Id and User_Id = :userId", nativeQuery = true)
	public List<String> getRoleNames(@Param(value = "userId") Integer userId);
}
