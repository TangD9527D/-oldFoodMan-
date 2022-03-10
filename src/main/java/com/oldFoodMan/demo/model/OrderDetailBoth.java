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
public class OrderDetailBoth implements Serializable {
	
	
	private static final long serialVersionUID = 1L;
	
	private Integer detailId;
	
	private Integer detailNumber;
	
	
	private Integer detailProductId;
	
	private Integer detailProductAmount;
	
	
    private double detailProductTotal;
	
	public Integer getDetailId() {
		return detailId;
	}





	public void setDetailId(Integer detailId) {
		this.detailId = detailId;
	}





	public Integer getDetailNumber() {
		return detailNumber;
	}





	public void setDetailNumber(Integer detailNumber) {
		this.detailNumber = detailNumber;
	}





	public Integer getDetailProductId() {
		return detailProductId;
	}





	public void setDetailProductId(Integer detailProductId) {
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

	
	




	@Override
	public int hashCode() {
		return Objects.hash(detailId, detailNumber, detailProductAmount, detailProductId, detailProductTotal);
	}





	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		OrderDetailBoth other = (OrderDetailBoth) obj;
		return Objects.equals(detailId, other.detailId) && Objects.equals(detailNumber, other.detailNumber)
				&& Objects.equals(detailProductAmount, other.detailProductAmount)
				&& Objects.equals(detailProductId, other.detailProductId)
				&& Double.doubleToLongBits(detailProductTotal) == Double.doubleToLongBits(other.detailProductTotal);
	}





	public OrderDetailBoth() {
	}

}
