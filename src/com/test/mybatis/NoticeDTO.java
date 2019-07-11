package com.test.mybatis;

public class NoticeDTO
{
	// 주요 속성 구성
	private String id,title,contents,noticedate;//, keyword;
	
	//getter/ setter 구성

	/*
	 * public String getKeyword() { return keyword; }
	 * 
	 * public void setKeyword(String keyword) { this.keyword = keyword; }
	 */

	public String getId()
	{
		return id;
	}

	public void setId(String id)
	{
		this.id = id;
	}

	public String getTitle()
	{
		return title;
	}

	public void setTitle(String title)
	{
		this.title = title;
	}

	public String getContents()
	{
		return contents;
	}

	public void setContents(String contents)
	{
		this.contents = contents;
	}

	public String getNoticedate()
	{
		return noticedate;
	}

	public void setNoticedate(String noticedate)
	{
		this.noticedate = noticedate;
	}

	
	
	
	
	
	
}
