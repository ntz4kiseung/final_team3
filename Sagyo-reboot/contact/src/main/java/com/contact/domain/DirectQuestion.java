package com.contact.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@SequenceGenerator(name="DIRECT_QUESTION_SEQ_GENERATOR"
				 , sequenceName = "DIRECT_QUESTION_SEQ"
				 , allocationSize = 1)
@Entity
@Table(name="DIRECT_QUESTION")
public class DirectQuestion {
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE
				  , generator = "DIRECT_QUESTION_SEQ_GENERATOR")
	@Column(name="ID")
	private int id;
	@Column(name="TITLE")
	private String title;
	@Column(name="USERID")
	private String userId;
	@Column(name="CONTENTS")
	private String contents;
	@Column(name="DIRECTQUESTIONDATE"
		  , insertable = false)
	private String directQuestionDate; 
	

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getDirectQuestionDate() {
		return directQuestionDate;
	}
	public void setDirectQuestionDate(String directQuestionDate) {
		this.directQuestionDate = directQuestionDate;
	}
	
}
