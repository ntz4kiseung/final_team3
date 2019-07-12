package com.test.mybatis;

import java.util.ArrayList;

public interface IJoinDAO
{
	public ArrayList<JoinDTO> joinlist();
	public ArrayList<JoinDTO> replylist();
	public int joininsert(JoinDTO joinDTO);
	public int replyinsert(JoinDTO joinDTO);
	public int joinupdate(JoinDTO joinDTO);
	public int serchjoin();
}
