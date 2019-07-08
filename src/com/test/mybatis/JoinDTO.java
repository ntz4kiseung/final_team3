package com.test.mybatis;

public class JoinDTO
{
	private String url,userId,nickname,userTypeId, joinDate, contents, delJoin, joinId;

	public String getUrl()
	{
		return url;
	}

	public void setUrl(String url)
	{
		this.url = url;
	}

	public String getUserId()
	{
		return userId;
	}

	public void setUserId(String userId)
	{
		this.userId = userId;
	}

	public String getNickname()
	{
		return nickname;
	}

	public void setNickname(String nickname)
	{
		this.nickname = nickname;
	}

	public String getUserTypeId()
	{
		return userTypeId;
	}

	public void setUserTypeId(String userTypeId)
	{
		this.userTypeId = userTypeId;
	}

	public String getJoinDate()
	{
		return joinDate;
	}

	public void setJoinDate(String joinDate)
	{
		this.joinDate = joinDate;
	}

	public String getContents()
	{
		return contents;
	}

	public void setContents(String contents)
	{
		this.contents = contents;
	}

	public String getDelJoin()
	{
		return delJoin;
	}

	public void setDelJoin(String delJoin)
	{
		this.delJoin = delJoin;
	}

	public String getJoinId()
	{
		return joinId;
	}

	public void setJoinId(String joinId)
	{
		this.joinId = joinId;
	}
}
