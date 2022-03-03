package com.oldFoodMan.demo.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="schedule")
public class ScheduleBean {
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="schedule_id")
	private Integer id ;
	
	
	@Column(name="like_locations")
	private String likelocations ;
	
	
	@Column(name="member_id")
	private Integer member_id ;

	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}



	public String getLikelocations() {
		return likelocations;
	}

	public void setLikelocations(String likelocations) {
		this.likelocations = likelocations;
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
		builder.append(", likeocations=");
		builder.append(likelocations);
		builder.append(", member_id=");
		builder.append(member_id);
		builder.append("]");
		return builder.toString();
	}
	
	

}
