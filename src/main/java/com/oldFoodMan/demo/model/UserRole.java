package com.oldFoodMan.demo.model;

import java.io.Serializable;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.Table;

@Entity
@IdClass(UserRoleId.class)
@Table(name = "user_role")
public class UserRole implements Serializable {
	
	@Id
	@Column(name = "USER_ID")
	private Integer id;
	
	@Id
	@Column(name = "ROLE_ID")
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
