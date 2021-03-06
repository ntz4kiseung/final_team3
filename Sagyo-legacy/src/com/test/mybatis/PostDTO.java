package com.test.mybatis;

public class PostDTO
{
	private String userId;
	private String title;
	private String addrSiId;
	private String addrSiName;
	private String addrGuId;
	private String addrGuName;
	private String addrDetail;
	private String interMainId;
	private String interMainName;
	private String interSubId;
	private String interSubName;
	private String interDetail;
	private String postDate;
	private String meetDate;
	private String samegender;
	private String drink;
	private String grade;
	private String moodName;
	private String contents;
	private String urlBad;
	private String url;
	private String nickname;
	private String telCertiId;
	private String emailCertiId;
	private String followId;
	private String postId;
	// 타입 수정 2019.07.10 15:40
	private int minNum;
	private int maxNum;
	private int limitGrade;
	private int postStatus;
	private int num;
	// 점수 확인 테스트용 속성 → 추후 제거함
	private int gradeHost;
	private int gradeAddr;
	private int gradeTitle;
	private int gradeContents;
	private int gradeInterDetail;
	private int gradeTotal;

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public int getGradeHost()
	{
		return gradeHost;
	}

	public void setGradeHost(int gradeHost)
	{
		this.gradeHost = gradeHost;
	}

	public int getGradeAddr()
	{
		return gradeAddr;
	}

	public void setGradeAddr(int gradeAddr)
	{
		this.gradeAddr = gradeAddr;
	}

	public int getGradeTitle()
	{
		return gradeTitle;
	}

	public void setGradeTitle(int gradeTitle)
	{
		this.gradeTitle = gradeTitle;
	}

	public int getGradeContents()
	{
		return gradeContents;
	}

	public void setGradeContents(int gradeContents)
	{
		this.gradeContents = gradeContents;
	}

	public int getGradeInterDetail()
	{
		return gradeInterDetail;
	}

	public void setGradeInterDetail(int gradeInterDetail)
	{
		this.gradeInterDetail = gradeInterDetail;
	}

	public int getGradeTotal()
	{
		return gradeTotal;
	}

	public void setGradeTotal(int gradeTotal)
	{
		this.gradeTotal = gradeTotal;
	}

	public String getUserId()
	{
		return userId;
	}

	public void setUserId(String userId)
	{
		this.userId = userId;
	}

	public String getTitle()
	{
		return title;
	}

	public void setTitle(String title)
	{
		this.title = title;
	}

	public String getAddrSiId()
	{
		return addrSiId;
	}

	public void setAddrSiId(String addrSiId)
	{
		this.addrSiId = addrSiId;
	}

	public String getAddrSiName()
	{
		return addrSiName;
	}

	public void setAddrSiName(String addrSiName)
	{
		this.addrSiName = addrSiName;
	}

	public String getAddrGuId()
	{
		return addrGuId;
	}

	public void setAddrGuId(String addrGuId)
	{
		this.addrGuId = addrGuId;
	}

	public String getAddrGuName()
	{
		return addrGuName;
	}

	public void setAddrGuName(String addrGuName)
	{
		this.addrGuName = addrGuName;
	}

	public String getAddrDetail()
	{
		return addrDetail;
	}

	public void setAddrDetail(String addrDetail)
	{
		this.addrDetail = addrDetail;
	}

	public String getInterMainId()
	{
		return interMainId;
	}

	public void setInterMainId(String interMainId)
	{
		this.interMainId = interMainId;
	}

	public String getInterMainName()
	{
		return interMainName;
	}

	public void setInterMainName(String interMainName)
	{
		this.interMainName = interMainName;
	}

	public String getInterSubId()
	{
		return interSubId;
	}

	public void setInterSubId(String interSubId)
	{
		this.interSubId = interSubId;
	}

	public String getInterSubName()
	{
		return interSubName;
	}

	public void setInterSubName(String interSubName)
	{
		this.interSubName = interSubName;
	}

	public String getInterDetail()
	{
		return interDetail;
	}

	public void setInterDetail(String interDetail)
	{
		this.interDetail = interDetail;
	}

	public String getPostDate()
	{
		return postDate;
	}

	public void setPostDate(String postDate)
	{
		this.postDate = postDate;
	}

	public String getMeetDate()
	{
		return meetDate;
	}

	public void setMeetDate(String meetDate)
	{
		this.meetDate = meetDate;
	}

	public String getSamegender()
	{
		return samegender;
	}

	public void setSamegender(String samegender)
	{
		this.samegender = samegender;
	}

	public String getDrink()
	{
		return drink;
	}

	public void setDrink(String drink)
	{
		this.drink = drink;
	}

	public String getGrade()
	{
		return grade;
	}

	public void setGrade(String grade)
	{
		this.grade = grade;
	}

	public String getMoodName()
	{
		return moodName;
	}

	public void setMoodName(String moodName)
	{
		this.moodName = moodName;
	}

	public String getContents()
	{
		return contents;
	}

	public void setContents(String contents)
	{
		this.contents = contents;
	}

	public String getUrlBad()
	{
		return urlBad;
	}

	public void setUrlBad(String urlBad)
	{
		this.urlBad = urlBad;
	}

	public String getUrl()
	{
		return url;
	}

	public void setUrl(String url)
	{
		this.url = url;
	}

	public String getNickname()
	{
		return nickname;
	}

	public void setNickname(String nickname)
	{
		this.nickname = nickname;
	}

	public String getTelCertiId()
	{
		return telCertiId;
	}

	public void setTelCertiId(String telCertiId)
	{
		this.telCertiId = telCertiId;
	}

	public String getEmailCertiId()
	{
		return emailCertiId;
	}

	public void setEmailCertiId(String emailCertiId)
	{
		this.emailCertiId = emailCertiId;
	}

	public String getFollowId()
	{
		return followId;
	}

	public void setFollowId(String followId)
	{
		this.followId = followId;
	}

	public String getPostId()
	{
		return postId;
	}

	public void setPostId(String postId)
	{
		this.postId = postId;
	}

	public int getMinNum()
	{
		return minNum;
	}

	public void setMinNum(int minNum)
	{
		this.minNum = minNum;
	}

	public int getMaxNum()
	{
		return maxNum;
	}

	public void setMaxNum(int maxNum)
	{
		this.maxNum = maxNum;
	}

	public int getLimitGrade()
	{
		return limitGrade;
	}

	public void setLimitGrade(int limitGrade)
	{
		this.limitGrade = limitGrade;
	}

	public int getPostStatus()
	{
		return postStatus;
	}

	public void setPostStatus(int postStatus)
	{
		this.postStatus = postStatus;
	}
	
	
}
