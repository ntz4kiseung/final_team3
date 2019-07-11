package com.test.mybatis;

import java.util.ArrayList;

public interface IFollowingDAO
{
	public ArrayList<FollowDTO> followingList();
	
	public ArrayList<FollowDTO> followingAddrList();
	
	public ArrayList<FollowDTO> followingInterList();
	
}
