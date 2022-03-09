package com.oldFoodMan.demo.model;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "collections")
@IdClass(CollectionsBoth.class)
public class Collections {

	@Id
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = ("member_id"))
	private Member member_id;

	@Id
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = ("record_id"))
	private FoodRecord record_id;

	public Collections() {

	}

	public Member getMember_id() {
		return member_id;
	}

	public void setMember_id(Member member_id) {
		this.member_id = member_id;
	}

	public FoodRecord getRecord_id() {
		return record_id;
	}

	public void setRecord_id(FoodRecord record_id) {
		this.record_id = record_id;
	}

	public Collections(Member member_id, FoodRecord record_id) {
		super();
		this.member_id = member_id;
		this.record_id = record_id;
	}

	
	
}
