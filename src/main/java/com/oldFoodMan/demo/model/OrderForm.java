package com.oldFoodMan.demo.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.PrePersist;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

@Entity
@Table(name="orderform")
public class OrderForm {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int orderId;
	
	@DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")
	@JsonFormat(pattern = "yyyy/MM/dd HH:mm:ss", timezone = "GMT+8")
	@Temporal(TemporalType.TIMESTAMP)
	private Date orderTime;
	
	private int orderAmount;
	
	private String orderProductName;
	
	private double orderPrice;
	
	private String orderCoupon;
	
	private int orderMemberId;
	
	private String orderNumber;
	
	@PrePersist // 當 Entity 狀態要變成 Persistent 的時候，做以下方法
	public void onCreate() {
		if(orderTime == null) {
			orderTime = new Date();
		}
	}

	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public Date getOrderTime() {
		return orderTime;
	}

	public void setOrderTime(Date orderTime) {
		this.orderTime = orderTime;
	}

	public int getOrderAmount() {
		return orderAmount;
	}

	public void setOrderAmount(int orderAmount) {
		this.orderAmount = orderAmount;
	}

	public String getOrderProductName() {
		return orderProductName;
	}

	public void setOrderProductName(String orderProductName) {
		this.orderProductName = orderProductName;
	}

	public double getOrderPrice() {
		return orderPrice;
	}

	public void setOrderPrice(double orderPrice) {
		this.orderPrice = orderPrice;
	}

	public String getOrderCoupon() {
		return orderCoupon;
	}

	public void setOrderCoupon(String orderCoupon) {
		this.orderCoupon = orderCoupon;
	}

	public int getOrderMemberId() {
		return orderMemberId;
	}

	public void setOrderMemberId(int orderMemberId) {
		this.orderMemberId = orderMemberId;
	}
	
	
	
	public String getOrderNumber() {
		return orderNumber;
	}

	public void setOrderNumber(String orderNumber) {
		this.orderNumber = orderNumber;
	}

	public OrderForm() {
	}
}
