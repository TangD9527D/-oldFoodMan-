package com.oldFoodMan.demo.dto;

import java.io.Serializable;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonProperty;

public class JoinVisDto implements Serializable {
	


	@JsonProperty(value = "add_condition")
	private String add_condition;

	@JsonProperty(value = "member_id")
	private Integer member_id;
	
	@JsonProperty(value = "vis_id")
	private Integer vis_id;
	
	
	public JoinVisDto() {
	}

	public String getAdd_condition() {
		return add_condition;
	}

	public void setAdd_condition(String add_condition) {
		this.add_condition = add_condition;
	}

	public Integer getMember_id() {
		return member_id;
	}

	public void setMember_id(Integer member_id) {
		this.member_id = member_id;
	}

	public Integer getVis_id() {
		return vis_id;
	}

	public void setVis_id(Integer vis_id) {
		this.vis_id = vis_id;
	}


	
	


	
	

}
