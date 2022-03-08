package com.oldFoodMan.demo.model.lemon;

import java.io.Serializable;
import java.sql.Blob;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

import com.oldFoodMan.demo.model.Member;

@Entity
@Table(name="reviewer_setting")
public class ReviewerSetting implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public ReviewerSetting() {
	}
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer reviewer_id;
	private String reviewer_url;
	private String reviewer_title;
	private String reviewer_subtitle;
	private String reviewer_intro;
	private String reviewer_camera;
	private String reviewer_occupation;
	private Blob reviewer_cover;
	private String reviewer_cover_filename;

	@Transient
	private MultipartFile coverImage;

	//一對一
	@OneToOne
	@JoinColumn(name = "member_id")
	private Member member;
	
	public ReviewerSetting(Member member) {
		this.member = member;
	}
	
	public Member getMember() {
		return member;
	}
	public void setMember(Member member) {
		this.member = member;
	}
	public Integer getReviewer_id() {
		return reviewer_id;
	}
	public void setReviewer_id(Integer reviewer_id) {
		this.reviewer_id = reviewer_id;
	}
	public String getReviewer_url() {
		return reviewer_url;
	}
	public void setReviewer_url(String reviewer_url) {
		this.reviewer_url = reviewer_url;
	}
	public String getReviewer_title() {
		return reviewer_title;
	}
	public void setReviewer_title(String reviewer_title) {
		this.reviewer_title = reviewer_title;
	}
	public String getReviewer_subtitle() {
		return reviewer_subtitle;
	}
	public void setReviewer_subtitle(String reviewer_subtitle) {
		this.reviewer_subtitle = reviewer_subtitle;
	}
	public String getReviewer_intro() {
		return reviewer_intro;
	}
	public void setReviewer_intro(String reviewer_intro) {
		this.reviewer_intro = reviewer_intro;
	}
	public String getReviewer_camera() {
		return reviewer_camera;
	}
	public void setReviewer_camera(String reviewer_camera) {
		this.reviewer_camera = reviewer_camera;
	}
	public String getReviewer_occupation() {
		return reviewer_occupation;
	}
	public void setReviewer_occupation(String reviewer_occupation) {
		this.reviewer_occupation = reviewer_occupation;
	}
	public Blob getReviewer_cover() {
		return reviewer_cover;
	}
	public void setReviewer_cover(Blob reviewer_cover) {
		this.reviewer_cover = reviewer_cover;
	}
	public String getReviewer_cover_filename() {
		return reviewer_cover_filename;
	}
	public void setReviewer_cover_filename(String reviewer_cover_filename) {
		this.reviewer_cover_filename = reviewer_cover_filename;
	}
	public MultipartFile getCoverImage() {
		return coverImage;
	}
	public void setCoverImage(MultipartFile coverImage) {
		this.coverImage = coverImage;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("ReviewerSetting [reviewer_id=");
		builder.append(reviewer_id);
		builder.append(", reviewer_url=");
		builder.append(reviewer_url);
		builder.append(", reviewer_title=");
		builder.append(reviewer_title);
		builder.append(", reviewer_subtitle=");
		builder.append(reviewer_subtitle);
		builder.append(", reviewer_intro=");
		builder.append(reviewer_intro);
		builder.append(", reviewer_camera=");
		builder.append(reviewer_camera);
		builder.append(", reviewer_occupation=");
		builder.append(reviewer_occupation);
		builder.append(", reviewer_cover=");
		builder.append(reviewer_cover);
		builder.append(", reviewer_cover_filename=");
		builder.append(reviewer_cover_filename);
		builder.append(", coverImage=");
		builder.append(coverImage);
		builder.append(", member=");
		builder.append(member);
		builder.append("]");
		return builder.toString();
	}
	
	
	
	
}
