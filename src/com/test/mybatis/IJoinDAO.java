package com.test.mybatis;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

public interface IJoinDAO
{
	public ArrayList<JoinDTO> joinlist(String hostPostId);
	public ArrayList<JoinDTO> replylist(String hostPostId);
	public int joininsert(@Param("joinDTO")JoinDTO joinDTO,@Param("postHostId")String postHostId);
	public int replyinsert(JoinDTO joinDTO);
	public int joinupdate(JoinDTO joinDTO);
	public int serchjoin(String hostPostId);
}
