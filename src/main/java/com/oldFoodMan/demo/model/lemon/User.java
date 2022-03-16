package com.oldFoodMan.demo.model.lemon;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import lombok.Data;

@Data
@Entity
@Table(name="reviewer_user")
public class User implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	private Integer member_id;
	private Integer follow_size=0;
	private Integer fan_size=0;
	@Transient
	private Integer is_friend=0;
	
	public User() {
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getMember_id() {
		return member_id;
	}

	public void setMember_id(Integer member_id) {
		this.member_id = member_id;
	}

	public Integer getFollow_size() {
		return follow_size;
	}

	public void setFollow_size(Integer follow_size) {
		this.follow_size = follow_size;
	}

	public Integer getFan_size() {
		return fan_size;
	}

	public void setFan_size(Integer fan_size) {
		this.fan_size = fan_size;
	}

	public Integer getIs_friend() {
		return is_friend;
	}

	public void setIs_friend(Integer is_friend) {
		this.is_friend = is_friend;
	}

	

	
	
}
