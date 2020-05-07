package com.common.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="INTEREST_SUB")
public class InterestSub {
	
	@Id
	@Column(name="INTERSUBID")
	private String interSubId;
	@Column(name="INTERSUBNAME")
	private String interSubName;
	public String getInterSubId() {
		return interSubId;
	}
	public void setInterSubId(String interSubId) {
		this.interSubId = interSubId;
	}
	public String getInterSubName() {
		return interSubName;
	}
	public void setInterSubName(String interSubName) {
		this.interSubName = interSubName;
	}
	
}
