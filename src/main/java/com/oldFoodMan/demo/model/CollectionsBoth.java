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
public class CollectionsBoth implements Serializable{

	
	private Integer member_id ;
	
	
	private Integer record_id ;
	
	
	public CollectionsBoth () {
		
	}


	public Integer getMember_id() {
		return member_id;
	}


	public void setMember_id(Integer member_id) {
		this.member_id = member_id;
	}


	public Integer getRecord_id() {
		return record_id;
	}


	public void setRecord_id(Integer record_id) {
		this.record_id = record_id;
	}


	@Override
	public int hashCode() {
		return Objects.hash(member_id, record_id);
	}

	
	
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		CollectionsBoth other = (CollectionsBoth) obj;
		return Objects.equals(member_id, other.member_id) && Objects.equals(record_id, other.record_id);
	}
	
	
	
}
