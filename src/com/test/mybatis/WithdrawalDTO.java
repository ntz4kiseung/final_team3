package com.test.mybatis;

public class WithdrawalDTO
{
	// 주요 속성 구성
	private String userid, pwd, roleid, nickname
					,name,birth,genderid;// 혹시몰라서 다 불러올라했는데 여기까지만 get set 구성하자요~

	//getter / setter 구성~ 
	public String getUserid()
	{
		return userid;
	}

	public void setUserid(String userid)
	{
		this.userid = userid;
	}

	public String getPwd()
	{
		return pwd;
	}

	public void setPwd(String pwd)
	{
		this.pwd = pwd;
	}

	public String getRoleid()
	{
		return roleid;
	}

	public void setRoleid(String roleid)
	{
		this.roleid = roleid;
	}

	public String getNickname()
	{
		return nickname;
	}

	public void setNickname(String nickname)
	{
		this.nickname = nickname;
	}

	public String getName()
	{
		return name;
	}

	public void setName(String name)
	{
		this.name = name;
	}

	public String getBirth()
	{
		return birth;
	}

	public void setBirth(String birth)
	{
		this.birth = birth;
	}

	public String getGenderid()
	{
		return genderid;
	}

	public void setGenderid(String genderid)
	{
		this.genderid = genderid;
	}
	
	
	
	
	
	
	
	
	
}
