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
}
