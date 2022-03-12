package com.oldFoodMan.demo.model;




import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;


@Entity
@Table(name = "orderdetail")

public class OrderDetail {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer detailId;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "detailNumber")
	@JsonIgnore
	private OrderForm detailNumber;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "detailProductId")
	private Product detailProductId;
	
	private Integer detailProductAmount;
	
	private double detailProductTotal;

	public Integer getDetailId() {
		return detailId;
	}

	public void setDetailId(Integer detailId) {
		this.detailId = detailId;
	}

	public OrderForm getDetailNumber() {
		return detailNumber;
	}

	public void setDetailNumber(OrderForm detailNumber) {
		this.detailNumber = detailNumber;
	}

	public Product getDetailProductId() {
		return detailProductId;
	}

	public void setDetailProductId(Product detailProductId) {
		this.detailProductId = detailProductId;
	}

	public Integer getDetailProductAmount() {
		return detailProductAmount;
	}

	public void setDetailProductAmount(Integer detailProductAmount) {
		this.detailProductAmount = detailProductAmount;
	}

	public double getDetailProductTotal() {
		return detailProductTotal;
	}

	public void setDetailProductTotal(double detailProductTotal) {
		this.detailProductTotal = detailProductTotal;
	}
	
	public OrderDetail() {
	}
	
	
	
}
