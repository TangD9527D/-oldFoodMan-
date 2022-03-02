package com.oldFoodMan.demo.model;

import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRoleRepository extends JpaRepository<Member, Role> {

}
