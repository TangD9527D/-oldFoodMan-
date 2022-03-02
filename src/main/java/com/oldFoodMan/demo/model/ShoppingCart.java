package com.oldFoodMan.demo.model;

import java.util.Objects;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;

@Entity
@IdClass(ShoppingCartBoth.class)
public class ShoppingCart {

	@Id
	private String product_id;
	
	@Id
	private String member_id;

	public ShoppingCart() {
		
	}
	
	public ShoppingCart(String product_id, String member_id) {
		super();
		this.product_id = product_id;
		this.member_id = member_id;
	}

	@Override
	public int hashCode() {
		return Objects.hash(member_id, product_id);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ShoppingCart other = (ShoppingCart) obj;
		return Objects.equals(member_id, other.member_id) && Objects.equals(product_id, other.product_id);
	}

	public String getProduct_id() {
		return product_id;
	}

	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	
	
}
