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
public class JoinVisBoth implements Serializable {
	private static final long serialVersionUID = 1L;

	private String member_id;

    private String my_food_vis_id;

    public JoinVisBoth() {
	}

	public JoinVisBoth(String member_id, String my_food_vis_id) {
		super();
		this.member_id = member_id;
		this.my_food_vis_id = my_food_vis_id;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getMy_food_vis_id() {
		return my_food_vis_id;
	}

	public void setMy_food_vis_id(String my_food_vis_id) {
		this.my_food_vis_id = my_food_vis_id;
	}

	@Override
	public int hashCode() {
		return Objects.hash(member_id, my_food_vis_id);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		JoinVisBoth other = (JoinVisBoth) obj;
		return Objects.equals(member_id, other.member_id) && Objects.equals(my_food_vis_id, other.my_food_vis_id);
	}

	

}