package com.oldFoodMan.demo.model;



import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "shoppingcart")
@IdClass(ShoppingCartBoth.class)
public class ShoppingCart {

	@Id
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "product_id")
	private Product product_id;
	
	@Id
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "member_id")
	private Member member_id;

	private Integer product_amount;
	
	
	public ShoppingCart() {
	}



	public Product getProduct_id() {
		return product_id;
	}



	public void setProduct_id(Product product_id) {
		this.product_id = product_id;
	}



	public Member getMember_id() {
		return member_id;
	}



	public void setMember_id(Member member_id) {
		this.member_id = member_id;
	}

	

	public Integer getProduct_amount() {
		return product_amount;
	}



	public void setProduct_amount(Integer product_amount) {
		this.product_amount = product_amount;
	}



	public ShoppingCart(Product product_id, Member member_id, Integer product_amount) {
		super();
		this.product_id = product_id;
		this.member_id = member_id;
		this.product_amount = product_amount;
	}



	
	
	
	


	









	
}
