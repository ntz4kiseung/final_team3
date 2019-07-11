package com.test.mybatis;

import java.util.ArrayList;

public interface ISignupDAO
{
	
	public int checkId(String id);
	public int checkNick(String nickname);
	public ArrayList<AddrDTO> addrSiList();
	public ArrayList<AddrDTO> addrGuList(String siid);
	public ArrayList<InterDTO> interMainList();
	
	public int userLoginInsert(UserDTO user);
	public int userEssentialInsert(UserDTO user);
	public int userSubInsert(UserDTO user);
	public int userAddrInsert(AddrDTO addr);
	public int userInterInsert(InterDTO inter);
	public int userTelInsert(UserDTO user);
	public int userEmailInsert(UserDTO user);
	
}
