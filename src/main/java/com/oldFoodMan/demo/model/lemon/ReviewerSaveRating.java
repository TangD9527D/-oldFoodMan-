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

	private Integer record_id;
	private Integer member_id;
	private Integer gender_sum;
	private float gender_avg;
	private String store_name;
	private String store_city;
	private String store_area;
	private String store_type;
	private String artical_title;
	
	public Integer getRecord_id() {
		return record_id;
	}
	public void setRecord_id(Integer record_id) {
		this.record_id = record_id;
	}
	public Integer getMember_id() {
		return member_id;
	}
	public void setMember_id(Integer member_id) {
		this.member_id = member_id;
	}
	public Integer getGender_sum() {
		return gender_sum;
	}
	public void setGender_sum(Integer gender_sum) {
		this.gender_sum = gender_sum;
	}
	public float getGender_avg() {
		return gender_avg;
	}
	public void setGender_avg(float gender_avg) {
		this.gender_avg = gender_avg;
	}
	public String getStore_name() {
		return store_name;
	}
	public void setStore_name(String store_name) {
		this.store_name = store_name;
	}
	public String getStore_city() {
		return store_city;
	}
	public void setStore_city(String store_city) {
		this.store_city = store_city;
	}
	public String getStore_area() {
		return store_area;
	}
	public void setStore_area(String store_area) {
		this.store_area = store_area;
	}
	public String getStore_type() {
		return store_type;
	}
	public void setStore_type(String store_type) {
		this.store_type = store_type;
	}
	public String getArtical_title() {
		return artical_title;
	}
	public void setArtical_title(String artical_title) {
		this.artical_title = artical_title;
	}
	
	
}