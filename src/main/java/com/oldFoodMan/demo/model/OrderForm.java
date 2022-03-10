package com.oldFoodMan.demo.model;

import java.util.Date;
import java.util.LinkedHashSet;
import java.util.Set;


import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

@Entity
@Table(name = "orderform")
public class OrderForm {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int orderNumber;
	
	private double orderTotal;
	
	private int orderMemberId;

	@OneToMany(fetch = FetchType.LAZY,mappedBy = "detailNumber")
	private Set<OrderDetail> orderDetail = new LinkedHashSet<OrderDetail>();
	
	@DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")
	@JsonFormat(pattern = "yyyy/MM/dd HH:mm:ss", timezone = "GMT+8")
	@Temporal(TemporalType.TIMESTAMP)
	private Date orderTime;
	
	@PrePersist    //當 Entity 狀態(有4個狀態)變成Persistent的時候做以下方法
	public void onCreat() {   //讓程式自動產生日期
		if(orderTime == null) {
			orderTime = new Date();
		}
	}
	
	
	
	
	public Set<OrderDetail> getOrderDetail() {
		return orderDetail;
	}




	public void setOrderDetail(Set<OrderDetail> orderDetail) {
		this.orderDetail = orderDetail;
	}




	public Date getOrderTime() {
		return orderTime;
	}



	public void setOrderTime(Date orderTime) {
		this.orderTime = orderTime;
	}



	public int getOrderNumber() {
		return orderNumber;
	}

	public void setOrderNumber(int orderNumber) {
		this.orderNumber = orderNumber;
	}

	public double getOrderTotal() {
		return orderTotal;
	}

	public void setOrderTotal(double orderTotal) {
		this.orderTotal = orderTotal;
	}

	public int getOrderMemberId() {
		return orderMemberId;
	}

	public void setOrderMemberId(int orderMemberId) {
		this.orderMemberId = orderMemberId;
	}
	
	public OrderForm() {
	}
}
