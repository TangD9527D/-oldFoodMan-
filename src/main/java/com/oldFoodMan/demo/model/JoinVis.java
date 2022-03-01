package com.oldFoodMan.demo.model;

import java.io.Serializable;
import java.util.Objects;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;

@Entity
@IdClass(JoinVisBoth.class)
public class JoinVis implements Serializable{
	
	@Id
	private Integer member_id;
	
	@Id
	private Integer my_food_vis_id;
	
	private String add_condition;
	
	private Integer add_check;
	
	
	
	
	public JoinVis() {
		
		
	}

	public JoinVis(Integer member_id, Integer my_food_vis_id, String add_condition, Integer add_check) {
		super();
		this.member_id = member_id;
		this.my_food_vis_id = my_food_vis_id;
		this.add_condition = add_condition;
		this.add_check = add_check;
	}

	public Integer getMember_id() {
		return member_id;
	}

	public void setMember_id(Integer member_id) {
		this.member_id = member_id;
	}

	public Integer getMy_food_vis_id() {
		return my_food_vis_id;
	}

	public void setMy_food_vis_id(Integer my_food_vis_id) {
		this.my_food_vis_id = my_food_vis_id;
	}

	public String getAdd_condition() {
		return add_condition;
	}

	public void setAdd_condition(String add_condition) {
		this.add_condition = add_condition;
	}

	public Integer getAdd_check() {
		return add_check;
	}

	public void setAdd_check(Integer add_check) {
		this.add_check = add_check;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("JoinVis [member_id=");
		builder.append(member_id);
		builder.append(", my_food_vis_id=");
		builder.append(my_food_vis_id);
		builder.append(", add_condition=");
		builder.append(add_condition);
		builder.append(", add_check=");
		builder.append(add_check);
		builder.append("]");
		return builder.toString();
	}

	@Override
	public int hashCode() {
		return Objects.hash(add_check, add_condition, member_id, my_food_vis_id);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		JoinVis other = (JoinVis) obj;
		return Objects.equals(add_check, other.add_check) && Objects.equals(add_condition, other.add_condition)
				&& Objects.equals(member_id, other.member_id) && Objects.equals(my_food_vis_id, other.my_food_vis_id);
	}
	
	

	

	



	
	
	
	
	
}
