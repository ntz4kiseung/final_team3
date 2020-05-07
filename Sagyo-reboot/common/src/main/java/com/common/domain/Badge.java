package com.common.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="POINT")
public class Badge {

	@Id
	@Column(name="BADGEPOINTID")
	private String badgePointId;
	@Column(name="BADGEPOINTNAME")
	private String badgePointName;
	@Column(name="BADGEPOINTCATEID")
	private String badgePointCateId;
	@Column(name="BADGEPOINTDESC1")
	private String badgePointDesc1;
	@Column(name="BADGEPOINTDESC2")
	private String badgePointDesc2;
	@Column(name="URL")
	private String url;
	@Column(name="CONDITION")
	private String condition;
	public String getBadgePointId() {
		return badgePointId;
	}
	public void setBadgePointId(String badgePointId) {
		this.badgePointId = badgePointId;
	}
	public String getBadgePointName() {
		return badgePointName;
	}
	public void setBadgePointName(String badgePointName) {
		this.badgePointName = badgePointName;
	}
	public String getBadgePointCateId() {
		return badgePointCateId;
	}
	public void setBadgePointCateId(String badgePointCateId) {
		this.badgePointCateId = badgePointCateId;
	}
	public String getBadgePointDesc1() {
		return badgePointDesc1;
	}
	public void setBadgePointDesc1(String badgePointDesc1) {
		this.badgePointDesc1 = badgePointDesc1;
	}
	public String getBadgePointDesc2() {
		return badgePointDesc2;
	}
	public void setBadgePointDesc2(String badgePointDesc2) {
		this.badgePointDesc2 = badgePointDesc2;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getCondition() {
		return condition;
	}
	public void setCondition(String condition) {
		this.condition = condition;
	}
	
}
