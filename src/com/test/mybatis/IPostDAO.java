package com.test.mybatis;

import java.util.ArrayList;

public interface IPostDAO
{
	public ArrayList<JoinDTO> joinlist();
	public ArrayList<PostDTO> postlist();
	public ArrayList<JoinDTO> replylist();
	public ArrayList<ReportDTO> reportlist();
	public ArrayList<FollowDTO> follow();
}
