package com.contact.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "FAQ")
public class FAQ {
	@Id
	@Column(name = "ID")
	private String id;
	@Column(name = "CONTENTS")
	private String contents;
	@Column(name = "FAQDATE")
	private String faqDate;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getFaqDate() {
		return faqDate;
	}
	public void setFaqDate(String faqDate) {
		this.faqDate = faqDate;
	}
	
}
