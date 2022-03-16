package com.oldFoodMan.demo.dto.lemon;

import java.io.Serializable;

public class ReviewerFoodDto implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer record_id;
	private Integer gender;
	private Integer gender1;
	private Integer gender2;
	private Integer gendersum;
	public Integer getRecord_id() {
		return record_id;
	}
	public void setRecord_id(Integer record_id) {
		this.record_id = record_id;
	}
	public Integer getGender() {
		return gender;
	}
	public void setGender(Integer gender) {
		this.gender = gender;
	}
	public Integer getGender1() {
		return gender1;
	}
	public void setGender1(Integer gender1) {
		this.gender1 = gender1;
	}
	public Integer getGender2() {
		return gender2;
	}
	public void setGender2(Integer gender2) {
		this.gender2 = gender2;
	}
	public Integer getGendersum() {
		return gendersum;
	}
	public void setGendersum(Integer gendersum) {
		this.gendersum = gendersum;
	}
	
	
}
