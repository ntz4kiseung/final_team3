package com.test.mybatis;

import java.util.ArrayList;

public interface IMyPageDAO
{
	public ArrayList<UserDTO> myPageList();
	public ArrayList<AddrDTO> myPageAddrList();
	public ArrayList<InterDTO> myPageInterList();
	

}
