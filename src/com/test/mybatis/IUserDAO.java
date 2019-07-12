package com.test.mybatis;

import java.util.ArrayList;

public interface IUserDAO
{
	public ArrayList<UserDTO> profile();
	
	public ArrayList<UserDTO> CertiCheck();
	
	public ArrayList<UserDTO> myPageList();
	
	public ArrayList<UserDTO> MyPageBad(); 
	
	public ArrayList<AddrDTO> myPageAddrList();
	
	public ArrayList<InterDTO> myPageInterList();
}
