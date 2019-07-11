package com.test.mybatis;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface IDirectquestioncompleteDAO
{
	

		
		//1:1문의 입력 
		public int drwrite(directquestioncompleteDTO d);
}
