package com.test.mybatis;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

public interface ISignupDAO
{
	
	public int checkId(String id);
	public int checkNick(String nickname);
	public ArrayList<AddrDTO> addrSiList();
	public ArrayList<AddrDTO> addrGuList(String siid);
	public ArrayList<InterDTO> interMainList();
	public ArrayList<InterDTO> interSubList(String mainid);
	
	public int userLoginInsert(UserDTO user);
	public int userEssentialInsert(@Param("user")UserDTO user, @Param("badgelogid")String badgelogid);
	
	public int userSubInsert(UserDTO user);
	
	public int userAddrInsert1(AddrDTO addr);
	public int userAddrInsert2(AddrDTO addr);
	public int userAddrInsert3(AddrDTO addr);
	
	public int userInterInsert1(InterDTO inter);
	public int userInterInsert2(InterDTO inter);
	public int userInterInsert3(InterDTO inter);
	
	
	public int userTelInsert(UserDTO user);
	public int userEmailInsert(UserDTO user);
	
	
	public int userNewBadgeInsert(UserDTO user);
	public String userNewBadgeSelect(UserDTO user);
	
}
