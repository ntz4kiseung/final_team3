package com.test.mybatis;
import java.util.ArrayList;

public interface IFollowDAO
{
	public int followinsert(FollowDTO followDTO);
	public int followdelete(FollowDTO followDTO);
	public ArrayList<FollowDTO> followingList();
	public ArrayList<FollowDTO> followingBad();
	public ArrayList<FollowDTO> followingAddrList();
	public ArrayList<FollowDTO> followingInterList();
	public ArrayList<FollowDTO> followerList();
	public ArrayList<FollowDTO> followerBad();
	public ArrayList<FollowDTO> followerAddrList();
	public ArrayList<FollowDTO> followerInterList();
}
