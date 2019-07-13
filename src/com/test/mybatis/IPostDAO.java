package com.test.mybatis;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

public interface IPostDAO
{
	public PostDTO postlist(@Param("followIds")String followIds, @Param("postHostId")String postHostId);
	public ArrayList<PostDTO> myReviewList();
	public ArrayList<PostDTO> reviewList();
	public ArrayList<PostDTO> searchList(SearchDTO s);
	public ArrayList<PostDTO> hostReview(String postId);
	public ArrayList<PostDTO> guestReview();
}
