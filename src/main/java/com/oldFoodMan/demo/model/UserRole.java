package com.oldFoodMan.demo.model;

import java.io.Serializable;
import java.util.Objects;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@IdClass(UserRoleId.class)
@Table(name = "user_role")
public class UserRole implements Serializable {
	
	@Id
	@ManyToOne(fetch = FetchType.EAGER,cascade = CascadeType.MERGE)
	@JoinColumn(name = "USER_ID")
	private Member userId;
	
	@Id
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "ROLE_ID")
	private Role role_id;

	public UserRole() {
	}

	public UserRole(Member userId, Role role_id) {
		super();
		this.userId = userId;
		this.role_id = role_id;
	}
	
	
	public Member getUser_id() {
		return userId;
	}

	public void setUser_id(Member userId) {
		this.userId = userId;
	}

	public Role getRole_id() {
		return role_id;
	}

	public void setRole_id(Role role_id) {
		this.role_id = role_id;
	}

	@Override
	public int hashCode() {
		return Objects.hash(userId, role_id);
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
		return Objects.equals(userId, other.userId) && Objects.equals(role_id, other.role_id);
	}
	
	
}
