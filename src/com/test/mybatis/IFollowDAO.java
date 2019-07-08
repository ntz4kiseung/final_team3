package com.test.mybatis;

import java.util.ArrayList;

public interface IFollowDAO
{
	public int followAdd(FollowDTO f);
	public ArrayList<FollowDTO> followList();
	public int followRemove(FollowDTO f);
	
	public ArrayList<UserDTO> myProfile();

	
}
