package com.oldFoodMan.demo.model;

import java.io.Serializable;
import java.sql.Blob;
import java.util.Date;

import javax.persistence.Column;
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
@Table(name="foodRecord")
public class FoodRecord implements Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="record_id")
	private Integer id;
	
	
	@DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")
	@JsonFormat(pattern = "yyyy/MM/dd HH:mm:ss", timezone = "GMT+8")
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="create_at")
	private Date added;
	
	public FoodRecord() {
	}
	
	@PrePersist    //當 Entity 狀態(有4個狀態)變成Persistent的時候做以下方法
	public void onCreat() {   //讓程式自動產生日期
		if(added == null) {
			added = new Date();
		}
	}
	
	
	private String title;
	private String content;
	private String shopName;
	private String shopType;
	private String audience;
	private String priceScope;
	private String city;
	private String town;
	private String shopAddress;
	private String tel;
	
	@Column(name="businessHours")
	private String businessHours;
	private String tag;
	
	@Column(name="coverImage")
	private Blob   coverImage;	
	private String uploadPicture;
	private String tasty;
	private String atmosphere;
	private String cp;
	private String gender;
	private String gender1;
	private String gender2;

	
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("FoodRecord [id=");
		builder.append(id);
		builder.append(", added=");
		builder.append(added);
		builder.append(", title=");
		builder.append(title);
		builder.append(", content=");
		builder.append(content);
		builder.append(", shopName=");
		builder.append(shopName);
		builder.append(", shopType=");
		builder.append(shopType);
		builder.append(", audience=");
		builder.append(audience);
		builder.append(", priceScope=");
		builder.append(priceScope);
		builder.append(", city=");
		builder.append(city);
		builder.append(", town=");
		builder.append(town);
		builder.append(", shopAddress=");
		builder.append(shopAddress);
		builder.append(", tel=");
		builder.append(tel);
		builder.append(", businessHours=");
		builder.append(businessHours);
		builder.append(", tag=");
		builder.append(tag);
		builder.append(", coverImage=");
		builder.append(coverImage);
		builder.append(", uploadPicture=");
		builder.append(uploadPicture);
		builder.append(", tasty=");
		builder.append(tasty);
		builder.append(", atmosphere=");
		builder.append(atmosphere);
		builder.append(", cp=");
		builder.append(cp);
		builder.append(", gender=");
		builder.append(gender);
		builder.append(", gender1=");
		builder.append(gender1);
		builder.append(", gender2=");
		builder.append(gender2);
		builder.append("]");
		return builder.toString();
	}


	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Date getAdded() {
		return added;
	}

	public void setAdded(Date added) {
		this.added = added;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getShopName() {
		return shopName;
	}

	public void setShopName(String shopName) {
		this.shopName = shopName;
	}

	public String getShopType() {
		return shopType;
	}

	public void setShopType(String shopType) {
		this.shopType = shopType;
	}

	public String getAudience() {
		return audience;
	}

	public void setAudience(String audience) {
		this.audience = audience;
	}

	public String getPriceScope() {
		return priceScope;
	}

	public void setPriceScope(String priceScope) {
		this.priceScope = priceScope;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getTown() {
		return town;
	}

	public void setTown(String town) {
		this.town = town;
	}

	public String getShopAddress() {
		return shopAddress;
	}

	public void setShopAddress(String shopAddress) {
		this.shopAddress = shopAddress;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getBusinessHours() {
		return businessHours;
	}

	public void setBusinessHours(String businessHours) {
		this.businessHours = businessHours;
	}

	public String getTag() {
		return tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}

	public Blob getCoverImage() {
		return coverImage;
	}

	public void setCoverImage(Blob coverImage) {
		this.coverImage = coverImage;
	}

	public String getUploadPicture() {
		return uploadPicture;
	}

	public void setUploadPicture(String uploadPicture) {
		this.uploadPicture = uploadPicture;
	}

	public String getTasty() {
		return tasty;
	}

	public void setTasty(String tasty) {
		this.tasty = tasty;
	}

	public String getAtmosphere() {
		return atmosphere;
	}

	public void setAtmosphere(String atmosphere) {
		this.atmosphere = atmosphere;
	}

	public String getCp() {
		return cp;
	}

	public void setCp(String cp) {
		this.cp = cp;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getGender1() {
		return gender1;
	}

	public void setGender1(String gender1) {
		this.gender1 = gender1;
	}

	public String getGender2() {
		return gender2;
	}

	public void setGender2(String gender2) {
		this.gender2 = gender2;
	}
	
}
