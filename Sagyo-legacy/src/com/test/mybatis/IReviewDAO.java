package com.test.mybatis;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

public interface IReviewDAO
{
	public int reviewInsertMain(@Param("postId")String postId, @Param("giveUserId")String giveUserId, @Param("takeUserId")String takeUserId, @Param("grade")String grade);
	
	public int reviewInsertSub(@Param("reviewId")String reviewId, @Param("badgePointId")String badgePointId, @Param("contents")String contents);

	public String getNextReviewId();
	
	public ArrayList<ReviewDTO> inquryView(@Param("userId")String userId, @Param("postId")String postId);
	
	public String pleaseReview(@Param("userId")String userId, @Param("postId")String postId);
}
