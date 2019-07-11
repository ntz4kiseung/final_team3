package com.test.mybatis;

import java.util.ArrayList;

public interface IUserDAO
{
	public ArrayList<UserDTO> profile();
	
	public ArrayList<UserDTO> CertiCheck();
}
