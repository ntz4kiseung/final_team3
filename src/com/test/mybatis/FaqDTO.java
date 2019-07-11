package com.test.mybatis;

public class FaqDTO
{
	// 주요 속성 구성
	private String id,title,contents,faqdate;//, keyword;
	
	//getter/ setter 구성

	/*
	 * public String getKeyword() { return keyword; }
	 * 
	 * public void setKeyword(String keyword) { this.keyword = keyword; }
	 */

	public String getFaqdate()
	{
		return faqdate;
	}

	public void setFaqdate(String faqdate)
	{
		this.faqdate = faqdate;
	}

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


	
	
	
	
	
}
