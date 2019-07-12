package com.test.mybatis;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

public interface IUserDAO
{
	public ArrayList<UserDTO> profile();
	
	public ArrayList<UserDTO> CertiCheck();
	
	public int userTelInsert(UserDTO user);
	public int userEmailInsert(UserDTO user);
	public int userNewBadgeInsert(UserDTO user);
	public String userNewBadgeSelect(UserDTO user);
	public int userEssentialInsert(@Param("user")UserDTO user, @Param("badgelogid")String badgelogid);
	public int checkId(String id);
	public int checkNick(String nickname);
	public int userLoginInsert(UserDTO user);
	public int userSubInsert(UserDTO user);
	
	// 회원가입 사용
	
	public int findIdTelCheck(@Param("name")String name, @Param("tel")String tel);
	public int findIdEmailCheck(@Param("name")String name, @Param("email")String email);
	public int findIdTelInsert(UserDTO user);
	public int findIdEmailInsert(UserDTO user);
	public String findIdTel(@Param("name")String name, @Param("tel")String tel);
	public String findIdEmail(@Param("name")String name, @Param("email")String email);
	public int findPwTelCheck(@Param("userId")String userId, @Param("name")String name, @Param("tel")String tel);
	public int findPwEmailCheck(@Param("userId")String userId, @Param("name")String name, @Param("email")String email);
	public int findPwTemp(UserDTO user);
	public String findPwdString(String userId);
	public int findPwTelInsert(UserDTO user);
	public int findPwEmailInsert(UserDTO user);
	
	// 아이디, 비밀번호 찾기 사용
	
	public int checkIdPw(@Param("userId")String userId, @Param("pwd")String pwd);
	
	// 로그인 사용
	
	public ArrayList<UserDTO> myPageList();
	
	public ArrayList<UserDTO> MyPageBad(); 
	
	public ArrayList<AddrDTO> myPageAddrList();
	
	public ArrayList<InterDTO> myPageInterList();
}
