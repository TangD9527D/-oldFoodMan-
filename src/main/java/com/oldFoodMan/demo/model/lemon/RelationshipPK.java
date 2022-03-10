package com.oldFoodMan.demo.model.lemon;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Id;

public class RelationshipPK implements Serializable{
	private Integer fromUserId;
	private Integer toUserId;
	
	@Column(name="from_user_id",nullable=false)
	@Id
	public Integer getFromUserId() {
		return fromUserId;
	}
	
	public void setFromUserId(Integer fromUserId) {
		this.fromUserId = fromUserId;
	}

	@Column(name="to_user_id",nullable=false)
	@Id
	public Integer getToUserId() {
		return toUserId;
	}

	public void setToUserId(Integer toUserId) {
		this.toUserId = toUserId;
	}
	
	@Override
	public boolean equals(Object o) {
		if(this==o)return true;
		if(o==null||getClass()!=o.getClass())return false;
		
		RelationshipPK that = (RelationshipPK)o;
		
		if(fromUserId!=null?!fromUserId.equals(that.fromUserId):that.fromUserId!=null)return false;
		if(toUserId!=null?!toUserId.equals(that.toUserId):that.toUserId!=null)return false;
		
		return true;
	}
	
	@Override
	public int hashCode() {
		int result = fromUserId != null ? fromUserId.hashCode():0;
		result=31*result+(toUserId!=null?toUserId.hashCode():0);
		return result;
	}
	
}
