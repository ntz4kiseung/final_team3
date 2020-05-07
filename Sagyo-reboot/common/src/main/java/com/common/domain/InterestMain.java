package com.common.domain;

import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.springframework.data.rest.core.annotation.RestResource;

@Entity
@Table(name="INTEREST_MAIN")
public class InterestMain {
	
	@Id
	@Column(name="INTERMAINID")
	private String interMainId;
	@Column(name="INTERMAINNAME")
	private String interMainName;
	
	@OneToMany
	@JoinColumn(name="INTERMAINID")
	@RestResource(path="interest-sub", rel="interest-sub")
	Set<InterestSub> interestSub;
	
	public String getInterMainId() {
		return interMainId;
	}
	public void setInterMainId(String interMainId) {
		this.interMainId = interMainId;
	}
	public String getInterMainName() {
		return interMainName;
	}
	public void setInterMainName(String interMainName) {
		this.interMainName = interMainName;
	}
	
}
