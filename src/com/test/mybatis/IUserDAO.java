package com.test.mybatis;

import java.util.ArrayList;

public interface IUserDAO
{
	public ArrayList<UserDTO> userList();
	
	public ArrayList<UserDTO> reviewList();
	
	public UserDTO search(String sid);
}
