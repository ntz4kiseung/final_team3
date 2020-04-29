package com.test.mybatis;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

public interface IInterDAO
{
	public ArrayList<InterDTO> interMainList();
	public ArrayList<InterDTO> interSubList(String mainid);
	public int userInterInsert1(InterDTO inter);
	public int userInterInsert2(InterDTO inter);
	public int userInterInsert3(InterDTO inter);
	public int updateInter1(@Param("userId")String userId, @Param("inter")InterDTO inter, @Param("inter2")InterDTO inter2);
	public int updateInter2(@Param("userId")String userId, @Param("inter")InterDTO inter, @Param("inter2")InterDTO inter2);
	public int updateInter3(@Param("userId")String userId, @Param("inter")InterDTO inter, @Param("inter2")InterDTO inter2);
	public InterDTO userInterest(String userId);
}
