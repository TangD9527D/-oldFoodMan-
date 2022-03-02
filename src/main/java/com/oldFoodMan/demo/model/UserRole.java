package com.oldFoodMan.demo.model;

import java.io.Serializable;
import java.util.Objects;

import javax.persistence.CascadeType;
import javax.persistence.Column;
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
	@ManyToOne(fetch = FetchType.EAGER,cascade = CascadeType.ALL)
	@JoinColumn(name = "USER_ID")
	private Member userId;
	
	@Id
	@Column(name = "ROLE_ID")
	private Integer role_id;

	public UserRole() {
	}

	public UserRole(Member userId, Integer role_id) {
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

	public Integer getRole_id() {
		return role_id;
	}

	public void setRole_id(Integer role_id) {
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
