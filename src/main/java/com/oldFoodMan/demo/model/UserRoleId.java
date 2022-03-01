package com.oldFoodMan.demo.model;

import java.io.Serializable;
import java.util.Objects;

public class UserRoleId implements Serializable {

	private Integer id;
	
	private Integer role_id;
	
	public UserRoleId() {
	}

	public UserRoleId(Integer id, Integer role_id) {
		super();
		this.id = id;
		this.role_id = role_id;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getRole_id() {
		return role_id;
	}

	public void setRole_id(Integer role_id) {
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
		UserRoleId other = (UserRoleId) obj;
		return Objects.equals(id, other.id) && Objects.equals(role_id, other.role_id);
	}

	
}
