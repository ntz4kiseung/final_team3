package com.test.mybatis;

public class ReviewDTO
{
	private String userId, userName, userurl, grade, badgePointId, badgePointName, takeurl, contents;
	private String giveUserId, takeUserId, giveuserName, giveuserUrl;
	private String postId;
	
	public String getGiveUserId() {
		return giveUserId;
	}
	public void setGiveUserId(String giveUserId) {
		this.giveUserId = giveUserId;
	}
	public String getTakeUserId() {
		return takeUserId;
	}
	public void setTakeUserId(String takeUserId) {
		this.takeUserId = takeUserId;
	}
	public String getPostId()
	{
		return postId;
	}
	public void setPostId(String postId)
	{
		this.postId = postId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserurl() {
		return userurl;
	}
	public void setUserurl(String userurl) {
		this.userurl = userurl;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
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
	public String getTakeurl() {
		return takeurl;
	}
	public void setTakeurl(String takeurl) {
		this.takeurl = takeurl;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getGiveuserName() {
		return giveuserName;
	}
	public void setGiveuserName(String giveuserName) {
		this.giveuserName = giveuserName;
	}
	public String getGiveuserUrl() {
		return giveuserUrl;
	}
	public void setGiveuserUrl(String giveuserUrl) {
		this.giveuserUrl = giveuserUrl;
	}



}
