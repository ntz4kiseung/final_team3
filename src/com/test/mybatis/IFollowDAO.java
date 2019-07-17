package com.test.mybatis;
import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

public interface IFollowDAO
{
	public int followinsert(FollowDTO followDTO);
	public int followdelete(FollowDTO followDTO);
	public ArrayList<FollowDTO> followingList(String userId);
	public ArrayList<FollowDTO> followingBad(String userId);
	public ArrayList<FollowDTO> followingAddrList(String userId);
	public ArrayList<FollowDTO> followingInterList(String userId);
	public ArrayList<FollowDTO> followerList(String userId);
	public ArrayList<FollowDTO> followerBad(String userId);
	public ArrayList<FollowDTO> followerAddrList(String userId);
	public ArrayList<FollowDTO> followerInterList(String userId);
	
	public int followinsert2(@Param("userId")String userId, @Param("followId")String followId );
	public int followdelete2(@Param("userId")String userId, @Param("followId")String followId );
	

}
