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
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

@Entity
@Table(name="member")
public class Member implements Serializable {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id")
	private Integer id;
	
	@Column(name = "memberName")
	private String memberName;
	
	@Column(name = "phone")
	private String phone; 
	
	@Email(message = "帳號必須為電子信箱格式")
	@NotBlank(message = "帳號不可為空")
	@Column(name = "account")
	private String account;
	
	@NotBlank(message = "密碼不可為空")
//	@Pattern(regexp = "^(?=.*[a-z])(?=.*[0-9])[a-zA-Z]{1}[a-zA-Z0-9]{5,15}$", 
//	 		 message = "密碼必須為6至16位英文及數字組成且首位字元為英文。")
	@Column(name = "memberPwd")
	private String memberPwd;
	
	@Column(name = "nickName")
	private String nickName;
	
	
	@Temporal(TemporalType.DATE)  //對應資料庫
	@Column(name = "birth")
	private Date birth;
	
	@Column(name = "city")
	private String city;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "createDate")
	private Date createDate; 
	
	public Member() {
	}

	@PrePersist // 當 Entity 狀態要變成 Persistent 的時候，做以下方法
	public void onCreate() {
		if(createDate == null) {
			createDate = new Date();
		}
	}
	
	public Member(Integer id, String account, String memberPwd) {
		this.id = id;
		this.account = account;
		this.memberPwd = memberPwd;
	}
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getMemberPwd() {
		return memberPwd;
	}

	public void setMemberPwd(String memberPwd) {
		this.memberPwd = memberPwd;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public Date getBirth() {
		return birth;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Member [id=");
		builder.append(id);
		builder.append(", memberName=");
		builder.append(memberName);
		builder.append(", phone=");
		builder.append(phone);
		builder.append(", account=");
		builder.append(account);
		builder.append(", memberPwd=");
		builder.append(memberPwd);
		builder.append(", nickName=");
		builder.append(nickName);
		builder.append(", birth=");
		builder.append(birth);
		builder.append(", city=");
		builder.append(city);
		builder.append(", createDate=");
		builder.append(createDate);
		builder.append("]");
		return builder.toString();
	}

	
}
