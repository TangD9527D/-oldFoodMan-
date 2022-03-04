package com.oldFoodMan.demo.model;

import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "product")
public class Product {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int product_id;
	
	@OneToMany(fetch = FetchType.LAZY,mappedBy = "productId")
	private Set<ShoppingCart> shoppingCart = new LinkedHashSet<ShoppingCart>();
	
	
	private String product_number;
	
	private String product_name;
	
	private String product_category;
	
	private int product_stock;
	
	private double product_discount;
	
	private double product_price;
	
	private String product_image;
	
	private String product_remark;
	
	@Transient
	private double product_newPrice;

	public double getProduct_newPrice() {
		return product_newPrice;
	}

	public void setProduct_newPrice(double product_newPrice) {
		this.product_newPrice = product_newPrice;
	}

	public int getProduct_id() {
		return product_id;
	}

	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	

	public String getProduct_number() {
		return product_number;
	}

	public void setProduct_number(String product_number) {
		this.product_number = product_number;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public String getProduct_category() {
		return product_category;
	}

	public void setProduct_category(String product_category) {
		this.product_category = product_category;
	}

	public int getProduct_stock() {
		return product_stock;
	}

	public void setProduct_stock(int product_stock) {
		this.product_stock = product_stock;
	}

	public double getProduct_discount() {
		return product_discount;
	}

	public void setProduct_discount(double product_discount) {
		this.product_discount = product_discount;
	}

	public double getProduct_price() {
		return product_price;
	}

	public void setProduct_price(double product_price) {
		this.product_price = product_price;
	}

	public String getProduct_image() {
		return product_image;
	}

	public void setProduct_image(String product_image) {
		this.product_image = product_image;
	}

	public String getProduct_remark() {
		return product_remark;
	}

	public void setProduct_remark(String product_remark) {
		this.product_remark = product_remark;
	}

	
	
    public Product() {
    }
    
   

}
