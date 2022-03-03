package com.oldFoodMan.demo.model;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

public class ScheduleBean {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="schedule_id")
	private Integer id ;
	
	
	@Column(name="location")
	private String location ;
	
	
	@Column(name="member_id")
	private Integer member_id ;

	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public Integer getMember_id() {
		return member_id;
	}

	public void setMember_id(Integer member_id) {
		this.member_id = member_id;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("ScheduleBean [id=");
		builder.append(id);
		builder.append(", location=");
		builder.append(location);
		builder.append(", member_id=");
		builder.append(member_id);
		builder.append("]");
		return builder.toString();
	}
	
	

}
