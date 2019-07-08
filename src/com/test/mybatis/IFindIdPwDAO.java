package com.test.mybatis;

import org.apache.ibatis.annotations.Param;

public interface IFindIdPwDAO
{
	public int findIdTelCheck(@Param("name")String name, @Param("tel")String tel);
	
	public int findIdEmailCheck(@Param("name")String name, @Param("email")String email);
	
	public int findIdTelInsert(UserDTO user);
	
	public int findIdEmailInsert(UserDTO user);
	
	public String findIdTel(@Param("name")String name, @Param("tel")String tel);
	
	public String findIdEmail(@Param("name")String name, @Param("email")String email);
	
}
