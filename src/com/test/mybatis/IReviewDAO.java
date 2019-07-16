package com.test.mybatis;

import org.apache.ibatis.annotations.Param;

public interface IReviewDAO
{
	public int reviewInsertMain(@Param("postId")String postId, @Param("hostId")String hostId, @Param("grade")String grade, @Param("userId")String userId);
	
	public int reviewInsertSub(@Param("badgeId")String badgeId, @Param("contents")String contents,@Param("reviewId")String reviewId);

	public String getNextReviewId();

}
