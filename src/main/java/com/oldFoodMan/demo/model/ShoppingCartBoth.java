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

	
	private Integer productId;
	
	
	private Integer memberId;
	
	private Integer productAmount;
	
	public ShoppingCartBoth() {
		
	}
	

	


	public Integer getProductId() {
		return productId;
	}





	public void setProductId(Integer productId) {
		this.productId = productId;
	}





	public Integer getMemberId() {
		return memberId;
	}





	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}





	public Integer getProductAmount() {
		return productAmount;
	}





	public void setProductAmount(Integer productAmount) {
		this.productAmount = productAmount;
	}





	@Override
	public int hashCode() {
		return Objects.hash(memberId, productAmount, productId);
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
		return Objects.equals(memberId, other.memberId) && Objects.equals(productAmount, other.productAmount)
				&& Objects.equals(productId, other.productId);
	}


	

	


	
	
}
