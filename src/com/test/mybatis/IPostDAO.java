package com.test.mybatis;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import org.apache.ibatis.annotations.Param;

public interface IPostDAO
{
	public PostDTO postlist(@Param("followIds")String followIds, @Param("postHostId")String postHostId);
	public ArrayList<PostDTO> myReviewList();
	public ArrayList<PostDTO> reviewList();
	public ArrayList<PostDTO> hostReview(String postId);
	public ArrayList<PostDTO> guestReview();
	public ArrayList<PostDTO> mainHotList();
	public ArrayList<PostDTO> mainRecommendList(String userId);
	public ArrayList<PostDTO> mainApproachingList();
	public ArrayList<PostDTO> searchList(SearchDTO s);
	public ArrayList<PostDTO> searchListGuest(SearchDTO s);
	public ArrayList<PostDTO> searchCateList(SearchDTO s);
	
}
