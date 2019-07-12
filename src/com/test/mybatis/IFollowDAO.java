package com.test.mybatis;

public interface IFollowDAO
{
	// 승원 추가부분
	public int followinsert(FollowDTO followDTO);
	public int followdelete(FollowDTO followDTO);
}
