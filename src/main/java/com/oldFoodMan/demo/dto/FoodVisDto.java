package com.oldFoodMan.demo.dto;

import java.io.Serializable;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonProperty;

public class FoodVisDto implements Serializable {
	
//	@JsonProperty(value = "vis_name")
//	private String vis_name;
	@JsonProperty(value = "vis_res_name")
	private String vis_res_name;
	@JsonProperty(value = "vis_date")
	private Date vis_date;
//	@JsonProperty(value = "vis_email")
//	private String vis_email;
	@JsonProperty(value = "vis_time")
	private String vis_time;
	@JsonProperty(value = "vis_location")
	private String vis_location;
	@JsonProperty(value = "vis_condition")
	private String vis_condition;
	@JsonProperty(value = "vis_num")
	private String vis_num;
	@JsonProperty(value = "member_id")
	private Integer member_id;
	
	public FoodVisDto() {
	}

//	public String getVis_name() {
//		return vis_name;
//	}
//
//	public void setVis_name(String vis_name) {
//		this.vis_name = vis_name;
//	}

	public String getVis_res_name() {
		return vis_res_name;
	}

	public void setVis_res_name(String vis_res_name) {
		this.vis_res_name = vis_res_name;
	}

	public Date getVis_date() {
		return vis_date;
	}

	public void setVis_date(Date vis_date) {
		this.vis_date = vis_date;
	}

//	public String getVis_email() {
//		return vis_email;
//	}
//
//	public void setVis_email(String vis_email) {
//		this.vis_email = vis_email;
//	}

	public String getVis_time() {
		return vis_time;
	}

	public void setVis_time(String vis_time) {
		this.vis_time = vis_time;
	}

	public String getVis_location() {
		return vis_location;
	}

	public void setVis_location(String vis_location) {
		this.vis_location = vis_location;
	}

	public String getVis_condition() {
		return vis_condition;
	}

	public void setVis_condition(String vis_condition) {
		this.vis_condition = vis_condition;
	}

	public String getVis_num() {
		return vis_num;
	}

	public void setVis_num(String vis_num) {
		this.vis_num = vis_num;
	}

	public Integer getMember_id() {
		return member_id;
	}

	public void setMemeber_id(Integer member_id) {
		this.member_id = member_id;
	}

	


	
	

}
