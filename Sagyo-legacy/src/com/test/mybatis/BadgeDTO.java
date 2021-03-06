package com.test.mybatis;

public class BadgeDTO
{
	
	private String badgeCateId, badgeCateName, badgePointId, badgePointName, url, badgePointDesc1, badgePointDesc2;
	
	//선아 DTO 추가 
	private int badgeCk,pointNum;
	private String badgeLogId, badgeDate;
	
	private String reviewDate,expirationDate,takeUserId,giveUserId;
	
	
	

	public String getTakeUserId()
	{
		return takeUserId;
	}

	public void setTakeUserId(String takeUserId)
	{
		this.takeUserId = takeUserId;
	}

	public String getGiveUserId()
	{
		return giveUserId;
	}

	public void setGiveUserId(String giveUserId)
	{
		this.giveUserId = giveUserId;
	}

	public int getPointNum()
	{
		return pointNum;
	}

	public void setPointNum(int pointNum)
	{
		this.pointNum = pointNum;
	}

	public String getReviewDate()
	{
		return reviewDate;
	}

	public void setReviewDate(String reviewDate)
	{
		this.reviewDate = reviewDate;
	}

	public String getExpirationDate()
	{
		return expirationDate;
	}

	public void setExpirationDate(String expirationDate)
	{
		this.expirationDate = expirationDate;
	}

	public String getBadgeDate()
	{
		return badgeDate;
	}

	public void setBadgeDate(String badgeDate)
	{
		this.badgeDate = badgeDate;
	}

	public String getBadgeLogId()
	{
		return badgeLogId;
	}

	public void setBadgeLogId(String badgeLogId)
	{
		this.badgeLogId = badgeLogId;
	}

	// 기승 추가 → MainBadgeDTO 를 없애도 될거 같음
	private String nickname;

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public int getBadgeCk()
	{
		return badgeCk;
	}

	public void setBadgeCk(int badgeCk)
	{
		this.badgeCk = badgeCk;
	}

	public String getBadgeCateId()
	{
		return badgeCateId;
	}

	public void setBadgeCateId(String badgeCateId)
	{
		this.badgeCateId = badgeCateId;
	}

	public String getBadgeCateName()
	{
		return badgeCateName;
	}

	public void setBadgeCateName(String badgeCateName)
	{
		this.badgeCateName = badgeCateName;
	}

	public String getBadgePointId()
	{
		return badgePointId;
	}

	public void setBadgePointId(String badgePointId)
	{
		this.badgePointId = badgePointId;
	}

	public String getBadgePointName()
	{
		return badgePointName;
	}

	public void setBadgePointName(String badgePointName)
	{
		this.badgePointName = badgePointName;
	}

	public String getUrl()
	{
		return url;
	}

	public void setUrl(String url)
	{
		this.url = url;
	}

	public String getBadgePointDesc1()
	{
		return badgePointDesc1;
	}

	public void setBadgePointDesc1(String badgePointDesc1)
	{
		this.badgePointDesc1 = badgePointDesc1;
	}

	public String getBadgePointDesc2()
	{
		return badgePointDesc2;
	}

	public void setBadgePointDesc2(String badgePointDesc2)
	{
		this.badgePointDesc2 = badgePointDesc2;
	}

	
	
	
	

}
/*
쪽지DTO	messageDTO	
내용	contents	String
보낸사람	giveUserId	String
받은사람	takeUserId	String
보낸날짜	sendDate	date
확인날짜	checkDate	date
		
뱃지DTO	badgeDTO	→ 유저가 가진 뱃지불러오기 + 평가시 뱃지 리스트 불러오기용
뱃지유형id	badgeCateId	String
뱃지유형이름	badgeCateName	String
뱃지id	badgePointId	String
뱃지이름	badgePointName	String
뱃지사진	url	String
뱃지설명1	badgePointDesc1	String
뱃지설명2	badgePointDesc2	String
*/