package com.test.mybatis;
import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

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
	
	public int followinsert2(@Param("followingId")String followingId, @Param("userId")String userId);
	public int followdelete2(@Param("followingId")String followingId, @Param("userId")String userId);

}
