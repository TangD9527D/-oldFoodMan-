package com.oldFoodMan.demo.model;

import java.io.Serializable;
import java.util.Objects;
/*
ID Class必須:
1. 實作java.io.Serializable介面
2. 定義預設建構子
3. 定義複合主鍵的所有組成欄位，並為這些欄位準備Getter/Setter
4. Override hashCode()與equals()方法 
*/
public class ShoppingCartBoth implements Serializable{
	
	private static final long serialVersionUID = 1L;

	
	private String product_id;
	
	
	private String member_id;
	
	public ShoppingCartBoth() {
		
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


	public ShoppingCartBoth(String product_id, String member_id) {
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
		ShoppingCartBoth other = (ShoppingCartBoth) obj;
		return Objects.equals(member_id, other.member_id) && Objects.equals(product_id, other.product_id);
	}
	
	
}
