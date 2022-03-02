package com.oldFoodMan.demo.dto;

import java.io.Serializable;

import com.fasterxml.jackson.annotation.JsonProperty;

//Dto與資料庫沒有做對應，只是單純放東西，所以不用寫Entity
public class RecordMessageDto implements Serializable {
	
	@JsonProperty(value = "message")   //避免其他人不知道msg是什麼，可以客製化Json的Key的名字，這裡將msg設為message 
	private String msg;  //寫一個屬性

	public RecordMessageDto() {
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}
	
	

}
