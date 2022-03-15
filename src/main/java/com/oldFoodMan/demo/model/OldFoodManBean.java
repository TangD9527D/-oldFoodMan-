package com.oldFoodMan.demo.model;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.PrePersist;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.transaction.Transactional;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
@Table(name="my_food_vis")
@JsonIgnoreProperties(value = "membervis")
public class OldFoodManBean implements Serializable{
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "vis_id")
	private Integer vis_id;
	
//	@Column(name = "vis_name")
//	private String vis_name;
//	
//	@Column(name = "vis_email")
//	private String vis_email;
	
	@DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")
	@JsonFormat(pattern = "yyyy/MM/dd HH:mm:ss",timezone = "GMT+8")
	@Temporal(TemporalType.TIMESTAMP)
	private Date added;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@JsonFormat(pattern = "yyyy-MM-dd",timezone = "GMT+8")
	@Temporal(TemporalType.DATE)
	private Date vis_date;
	
	@Column(name="vis_time")
	private String vis_time;
	
	@Column(name = "vis_res_name")
	private String vis_res_name;
	
	@Column(name = "vis_location")
	private String vis_location; 
	
	@Column(name = "vis_num")
	private String vis_num;
	
	@Column(name = "vis_condition")
	private String vis_condition;
	
	
//	@ManyToOne(fetch = FetchType.EAGER)
//	@JoinColumn(name = "member_id")
//	@JsonIgnore
	private Integer member_id;
	
	
//	@JsonIgnore
	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "add_food_group",
	joinColumns = {@JoinColumn(name="my_food_vis_id",referencedColumnName = "vis_id")},
	inverseJoinColumns = {@JoinColumn(name="member_id",referencedColumnName = "id")})
	private Set<Member> membervis = new HashSet<Member>();
	
	
//	@OneToMany(fetch = FetchType.LAZY,mappedBy = "my_food_vis_id",cascade = CascadeType.ALL)
//	private Set<JoinVis> joinvis = new LinkedHashSet<JoinVis>();
	
	


	public OldFoodManBean() {
		
	}
	
	@PrePersist // 當 Entity 狀態要變成 Persistent 的時候，做以下方法
	public void onCreate() {
		if(added == null) {
			
			added=new Date();
		}
		
	}


	public Integer getVis_id() {
		return vis_id;
	}


	public void setVis_id(Integer vis_id) {
		this.vis_id = vis_id;
	}


	public Date getAdded() {
		return added;
	}

	public void setAdded(Date added) {
		this.added = added;
	}
//
//	public String getVis_name() {
//		return vis_name;
//	}
//
//
//	public void setVis_name(String vis_name) {
//		this.vis_name = vis_name;
//	}
//
//
//	public String getVis_email() {
//		return vis_email;
//	}
//
//
//	public void setVis_email(String vis_email) {
//		this.vis_email = vis_email;
//	}


	public Date getVis_date() {
		return vis_date;
	}


	public void setVis_date(Date vis_date) {
		this.vis_date = vis_date;
	}


	public String getVis_time() {
		return vis_time;
	}


	public void setVis_time(String vis_time) {
		this.vis_time = vis_time;
	}


	public String getVis_res_name() {
		return vis_res_name;
	}


	public void setVis_res_name(String vis_res_name) {
		this.vis_res_name = vis_res_name;
	}


	public String getVis_location() {
		return vis_location;
	}


	public void setVis_location(String vis_location) {
		this.vis_location = vis_location;
	}


	public String getVis_num() {
		return vis_num;
	}


	public void setVis_num(String vis_num) {
		this.vis_num = vis_num;
	}


	public String getVis_condition() {
		return vis_condition;
	}


	public void setVis_condition(String vis_condition) {
		this.vis_condition = vis_condition;
	}

	

	
	
	public Integer getMember_id() {
		return member_id;
	}

	public void setMember_id(Integer member_id) {
		this.member_id = member_id;
	}
	


	public Set<Member> getMembervis() {
		return membervis;
	}

	public void setMembervis(Set<Member> membervis) {
		this.membervis = membervis;
	}

	public Set<Member> getMember() {
		return membervis;
	}

	public void setMember(Set<Member> membervis) {
		this.membervis = membervis;
	}



	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("OldFoodManBean [vis_id=");
		builder.append(vis_id);
		builder.append(", added=");
		builder.append(added);
		builder.append(", vis_date=");
		builder.append(vis_date);
		builder.append(", vis_time=");
		builder.append(vis_time);
		builder.append(", vis_res_name=");
		builder.append(vis_res_name);
		builder.append(", vis_location=");
		builder.append(vis_location);
		builder.append(", vis_num=");
		builder.append(vis_num);
		builder.append(", vis_condition=");
		builder.append(vis_condition);
		builder.append(", member_id=");
		builder.append(member_id);
		builder.append(", membervis=");
		builder.append(membervis);
		builder.append("]");
		return builder.toString();
	}

	

	



	
	
	
	
	
}
