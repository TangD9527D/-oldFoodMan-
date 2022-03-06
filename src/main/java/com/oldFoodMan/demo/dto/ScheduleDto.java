package com.oldFoodMan.demo.dto;

import java.io.Serializable;

import com.fasterxml.jackson.annotation.JsonProperty;

public class ScheduleDto implements Serializable {
	
	@JsonProperty(value="likelocations")
	private String likeLocations ;
	
	@JsonProperty(value="member_id")
	private Integer member_id;
	
	
	

	public String getLikeLocations() {
		return likeLocations;
	}

	public void setLikeLocations(String likeLocations) {
		this.likeLocations = likeLocations;
	}





	public Integer getMember_id() {
		return member_id;
	}

	public void setMember_id(Integer member_id) {
		this.member_id = member_id;
	}
	
	

}
