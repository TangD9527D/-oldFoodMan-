package com.oldFoodMan.demo.model;

import java.io.Serializable;
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
import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

@Entity
@Table(name="foodRecord")
public class OldFoodManTest implements Serializable{
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="record_id")
	private Integer id ;
	
//	@Size(min = 3,max = 10,message = "看看你後面 3~10 次")
//	@NotEmpty(message="把衣服穿起來")
////	@Email(message="請給我輸入你的@")
	@Column(name="title")
	private String title ;
	
//	@DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")  //JAVA
//	@JsonFormat(pattern = "yyyy/MM/dd HH:mm:ss",timezone = "GMT+8") //JSON
//	@Temporal(TemporalType.TIMESTAMP)  //SQL
	@Column(name="content")
	private String content ;
	
	private String coverImage;
	
	
	

	public String getCoverImage() {
		return coverImage;
	}

	public void setCoverImage(String coverImage) {
		this.coverImage = coverImage;
	}

	public Integer getId() {
		return id;
	}
	
	public void setId(Integer id) {
		this.id = id;
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

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("OldFoodManTest [id=");
		builder.append(id);
		builder.append(", title=");
		builder.append(title);
		builder.append(", content=");
		builder.append(content);
		builder.append(", coverImage=");
		builder.append(coverImage);
		builder.append("]");
		return builder.toString();
	}


	
	
	
//	@PrePersist	// 當 Entity 狀態要變成 Persistent 的時候，做以下方法
//	public void onCreate() { 
//		
//		if(added == null) {
//			
//			added=new Date();
//			
//		}
//		
//	}
	

	
	
	
}
