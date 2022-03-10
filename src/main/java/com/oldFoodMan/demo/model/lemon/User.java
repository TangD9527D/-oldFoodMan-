package com.oldFoodMan.demo.model.lemon;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Transient;

@Entity
public class User implements Serializable {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	private String username;
	
	private Integer followSize=0;
	private Integer fanSize=0;
	
	@Transient
	private Integer isFriend=0;
	
	public User() {
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public Integer getFollowSize() {
		return followSize;
	}

	public void setFollowSize(Integer followSize) {
		this.followSize = followSize;
	}

	public Integer getFanSize() {
		return fanSize;
	}

	public void setFanSize(Integer fanSize) {
		this.fanSize = fanSize;
	}

	public Integer getIsFriend() {
		return isFriend;
	}

	public void setIsFriend(Integer isFriend) {
		this.isFriend = isFriend;
	}
	
	
}
