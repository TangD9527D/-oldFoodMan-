package com.oldFoodMan.demo.model;




import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "shoppingcart")
@IdClass(ShoppingCartBoth.class)
public class ShoppingCart {

	@Id
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "productId")
	private Product productId;
	
	@Id
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "memberId")
	@JsonIgnore
	private Member memberId;

	private Integer productAmount;
	
	@Transient
	private double productPay;
	
	@Transient
	private double productNewPay;
	
	public ShoppingCart() {
	}


	public Product getProductId() {
		return productId;
	}


	public void setProductId(Product productId) {
		this.productId = productId;
	}


	public Member getMemberId() {
		return memberId;
	}


	public void setMemberId(Member memberId) {
		this.memberId = memberId;
	}


	public Integer getProductAmount() {
		return productAmount;
	}


	public void setProductAmount(Integer productAmount) {
		this.productAmount = productAmount;
	}


	public double getProductPay() {
		return productPay;
	}


	public void setProductPay(double productPay) {
		this.productPay = productPay;
	}


	public double getProductNewPay() {
		return productNewPay;
	}


	public void setProductNewPay(double productNewPay) {
		this.productNewPay = productNewPay;
	}


	public ShoppingCart(Product productId, Member memberId, Integer productAmount, double productPay,
			double productNewPay) {
		super();
		this.productId = productId;
		this.memberId = memberId;
		this.productAmount = productAmount;
		this.productPay = productPay;
		this.productNewPay = productNewPay;
	}


	

	



	


	
	
	
	


	









	
}
