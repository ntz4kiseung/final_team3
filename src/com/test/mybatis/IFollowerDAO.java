package com.test.mybatis;

import java.util.ArrayList;

public interface IFollowerDAO
{
	public ArrayList<FollowDTO> followerList();
	
	public ArrayList<FollowDTO> followerBad();
	
	public ArrayList<FollowDTO> followerAddrList();
	
	public ArrayList<FollowDTO> followerInterList();
	
}
