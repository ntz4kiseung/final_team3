package com.test.mybatis;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface IPostDAO
{
	public PostDTO postlist(String followIds);
	public ArrayList<PostDTO> myReviewList();
	public ArrayList<PostDTO> reviewList();
	public ArrayList<PostDTO> searchList(SearchDTO s);
	public ArrayList<PostDTO> hostReview(String postId);
	public ArrayList<PostDTO> guestReview();
}
