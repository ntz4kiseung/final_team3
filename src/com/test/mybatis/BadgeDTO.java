package com.test.mybatis;

public class BadgeDTO
{
	
	private String badgeCateId, badgeCateName, badgePointId, badgePointName, url, badgePointDesc1, badgePointDesc2;

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