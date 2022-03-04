package com.oldFoodMan.demo.model;

import java.io.Serializable;
import java.util.Date;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;


@Entity
@Table(name="record_messages")
public class RecordMessages implements Serializable {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id")
	private Integer id;
	
// https://docs.jboss.org/hibernate/stable/validator/reference/en-US/html_single/#section-builtin-constraints
//	@NotEmpty(message = "不可空白")
//	@Size(min = 3, max = 20,message = "請輸入 3 至 20 個字")
//	@Email(message = "請輸入 Email")
	@Column(name="text")
	private String text;
	
	@DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")
	@JsonFormat(pattern = "yyyy/MM/dd HH:mm:ss", timezone = "GMT+8")
	@Temporal(TemporalType.TIMESTAMP)
	private Date added;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "member_id")
	@JsonIgnore
	private Member member_id;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "record_id")
	@JsonIgnore
	private FoodRecord record_id;

	

	public RecordMessages() {
	}
	
	@PrePersist // 當 Entity 狀態要變成 Persistent 的時候，做以下方法
	public void onCreate() {
		if(added == null) {
			added = new Date();
		}
	}

	
	
	public FoodRecord getRecord_id() {
		return record_id;
	}

	public void setRecord_id(FoodRecord record_id) {
		this.record_id = record_id;
	}

	public Member getMember_id() {
		return member_id;
	}

	public void setMember_id(Member member_id) {
		this.member_id = member_id;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public Date getAdded() {
		return added;
	}

	public void setAdded(Date added) {
		this.added = added;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("WorkMessages [id=");
		builder.append(id);
		builder.append(", text=");
		builder.append(text);
		builder.append(", added=");
		builder.append(added);
		builder.append("]");
		return builder.toString();
	}


}
