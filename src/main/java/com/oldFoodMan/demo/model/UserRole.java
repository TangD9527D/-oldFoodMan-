package com.oldFoodMan.demo.model;

import java.io.Serializable;
import java.util.Objects;


public class UserRole implements Serializable {
	
	private Integer id;
	
	private Integer role_id;

	public UserRole() {
	}

	public UserRole(Integer id, Integer role_id) {
		super();
		this.id = id;
		this.role_id = role_id;
	}

	@Override
	public int hashCode() {
		return Objects.hash(id, role_id);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		UserRole other = (UserRole) obj;
		return Objects.equals(id, other.id) && Objects.equals(role_id, other.role_id);
	}
	
	
}
