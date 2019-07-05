package com.test.mybatis;

import java.util.ArrayList;

public interface IPostDAO
{
	public ArrayList<JoinDTO> joinlist();
	public ArrayList<PostDTO> postlist();
}
