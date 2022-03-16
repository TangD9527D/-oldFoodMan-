package com.oldFoodMan.demo.model.lemon;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="reviewer_saveRating")
public class ReviewerSaveRating implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id")
	private Integer id;
	private Integer recordId;
	private Integer gender;
	private Integer gender1;
	private Integer gender2;
	private Integer gendersum;
	public Integer getRecordId() {
		return recordId;
	}
	public void setRecordId(Integer recordId) {
		this.recordId = recordId;
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
