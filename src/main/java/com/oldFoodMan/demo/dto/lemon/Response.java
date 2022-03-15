package com.oldFoodMan.demo.dto.lemon;

import java.io.Serializable;

public class Response implements Serializable {
	private boolean rrFlag;
	private String rrText;
	private Integer fanSize;
	
	public Response(boolean rrFlag,String rrText){
		rrFlag = this.rrFlag;
		rrText = this.rrText;
	}
	
	public Response(boolean rrFlag,String rrText,Integer fanSize){
		rrFlag = this.rrFlag;
		rrText = this.rrText;
		fanSize = this.fanSize;
	}

	public boolean isRrFlag() {
		return rrFlag;
	}

	public void setRrFlag(boolean rrFlag) {
		this.rrFlag = rrFlag;
	}

	public String getRrText() {
		return rrText;
	}

	public void setRrText(String rrText) {
		this.rrText = rrText;
	}

	public Integer getFanSize() {
		return fanSize;
	}

	public void setFanSize(Integer fanSize) {
		this.fanSize = fanSize;
	}
	
	
}
