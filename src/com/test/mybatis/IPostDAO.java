package com.test.mybatis;

import java.util.ArrayList;

public interface IPostDAO
{
	public ArrayList<JoinDTO> joinlist();
	public PostDTO postlist(String followIds);
	public ArrayList<JoinDTO> replylist();
	public ArrayList<ReportDTO> reportlist();
	public int followinsert(FollowDTO followDTO);
	public int followdelete(FollowDTO followDTO);
	public ArrayList<PostDTO> myReviewList();
	public ArrayList<PostDTO> reviewList();
	public ArrayList<PostDTO> searchList(SearchDTO s);
	public ArrayList<PostDTO> hostReview();
	public ArrayList<PostDTO> guestReview();
	public int joininsert(JoinDTO joinDTO);
	public int reportpostinsert(ReportDTO reportDTO);
	public int reportjoininsert(ReportDTO reportDTO);
	public int replyinsert(JoinDTO joinDTO);
	public int reportreplyinsert(ReportDTO reportDTO);
	public int joindelcheckinsert(ReportDTO reportDTO);
}
