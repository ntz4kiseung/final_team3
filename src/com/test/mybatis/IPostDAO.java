package com.test.mybatis;

import java.util.ArrayList;

public interface IPostDAO
{
	public ArrayList<JoinDTO> joinlist();
	public PostDTO postlist();
	public ArrayList<JoinDTO> replylist();
	public ArrayList<ReportDTO> reportlist();
	public int followinsert(FollowDTO followDTO);
	public int followdelete(FollowDTO followDTO);
	public ArrayList<PostDTO> myReviewList();
	public ArrayList<PostDTO> reviewList();
	public int joininsert(JoinDTO joinDTO);
}
