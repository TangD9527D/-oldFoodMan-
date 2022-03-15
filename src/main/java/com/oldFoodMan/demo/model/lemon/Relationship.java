package com.oldFoodMan.demo.model.lemon;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.Table;

@Entity
@IdClass(RelationshipPK.class)
@Table(name="reviewer_relationship")
public class Relationship {
	private Integer from_user_id;
	private Integer to_user_id;
	
	public Relationship() {
	}
	
	public Relationship(Integer fromUserId,Integer toUserId) {
		this.from_user_id = fromUserId;
		this.to_user_id = toUserId;
	}
	
	@Id
	@Column(name = "from_user_id",nullable=false)
	public Integer getFromUserId() {
		return from_user_id;
	}
	
	public void setFromUserId(Integer fromUserId) {
		this.from_user_id = fromUserId;
	}
	
	@Id
	@Column(name = "to_user_id",nullable=false)
	public Integer getToUserId() {
		return to_user_id;
	}
	
	public void setToUserId(Integer toUserId) {
		this.to_user_id = toUserId;
	}
	
	@Override
	public boolean equals(Object o) {
		if(this==o) return true;
		if(o==null||getClass()!=o.getClass())return false;
		
		Relationship that = (Relationship)o;
		
		if(from_user_id!=null?!from_user_id.equals(that.from_user_id):that.from_user_id!=null)return false;
		if(to_user_id!=null?!to_user_id.equals(that.to_user_id):that.to_user_id!=null)return false;
		
		return true;
	}
	
	@Override
	public int hashCode() {
		int result = from_user_id != null ? from_user_id.hashCode():0;
		result = 31* result+(to_user_id!=null?to_user_id.hashCode():0);
		return result;
	}
}
