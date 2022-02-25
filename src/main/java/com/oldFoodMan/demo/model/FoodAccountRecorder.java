package com.oldFoodMan.demo.model;


import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "food_account_recorder")
public class FoodAccountRecorder {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer resid;
	
	private String resdate;
	
	private String resname;
	
	private String reskind;
	
	private String resphoto;
	
	private Integer respay;
	
	
	
	public Integer getResid() {
		return resid;
	}



	public void setResid(Integer resid) {
		this.resid = resid;
	}



	public String getResdate() {
		return resdate;
	}



	public void setResdate(String resdate) {
		this.resdate = resdate;
	}



	public String getResname() {
		return resname;
	}



	public void setResname(String resname) {
		this.resname = resname;
	}



	public String getReskind() {
		return reskind;
	}



	public void setReskind(String reskind) {
		this.reskind = reskind;
	}



	public String getResphoto() {
		return resphoto;
	}



	public void setResphoto(String resphoto) {
		this.resphoto = resphoto;
	}



	public Integer getRespay() {
		return respay;
	}



	public void setRespay(Integer respay) {
		this.respay = respay;
	}

	

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("FoodAccountRecorder [resid=");
		builder.append(resid);
		builder.append(", resdate=");
		builder.append(resdate);
		builder.append(", resname=");
		builder.append(resname);
		builder.append(", reskind=");
		builder.append(reskind);
		builder.append(", resphoto=");
		builder.append(resphoto);
		builder.append(", respay=");
		builder.append(respay);
		builder.append("]");
		return builder.toString();
	}



	public FoodAccountRecorder() {
	}

}
