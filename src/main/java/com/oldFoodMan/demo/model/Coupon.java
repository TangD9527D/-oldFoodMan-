package com.oldFoodMan.demo.model;

import javax.persistence.Entity;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import javax.persistence.Table;

@Entity
@Table(name = "coupon")
public class Coupon {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private int couponId;
	
	private String couponNumber;
	
	
	
	
	public int getId() {
		return id;
	}




	public void setId(int id) {
		this.id = id;
	}




	public int getCouponId() {
		return couponId;
	}




	public void setCouponId(int couponId) {
		this.couponId = couponId;
	}




	public String getCouponNumber() {
		return couponNumber;
	}




	public void setCouponNumber(String couponNumber) {
		this.couponNumber = couponNumber;
	}


	public Coupon() {
	}

}
