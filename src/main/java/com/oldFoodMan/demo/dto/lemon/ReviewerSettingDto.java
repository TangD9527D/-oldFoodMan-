package com.oldFoodMan.demo.dto.lemon;

import java.io.Serializable;

public class ReviewerSettingDto implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String reviewer_title;
	private String reviewer_subtitle;
	private String reviewer_intro;
	private String reviewer_camera;
	private String reviewer_occupation;
	
	
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
	
	
}
