package com.test.mybatis;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

public interface IPostDAO
{
	public PostDTO postlist(@Param("followIds")String followIds, @Param("postHostId")String postHostId);
	public ArrayList<PostDTO> myReviewList(String userId);
	public ArrayList<PostDTO> reviewList(String userId);
	public ArrayList<PostDTO> hostReview(String postId);
	public ArrayList<PostDTO> guestReview(@Param("postId")String postId, @Param("userId")String userId);
	public ArrayList<PostDTO> mainHotList();
	public ArrayList<PostDTO> mainRecommendList(String userId);
	public ArrayList<PostDTO> mainApproachingList();
	public ArrayList<PostDTO> searchList(SearchDTO s);
	public ArrayList<PostDTO> searchListGuest(SearchDTO s);
	public ArrayList<PostDTO> searchCateList(SearchDTO s);
	public int postinsert(PostDTO postDTO);
	public ArrayList<PostDTO> searchPostIdList(String userId);
	public int postlistCheck(@Param("userId")String userId, @Param("postId")String postId);
	public String getHost(String postId);
	
	
}
