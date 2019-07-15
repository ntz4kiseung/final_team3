package com.test.mybatis;

public interface IReviewDAO
{
	public int reviewInsertMain(String postId, String hostId, String grade, String userId);
	
	public int reviewInsertSub(String badgeId, String contents);

}
