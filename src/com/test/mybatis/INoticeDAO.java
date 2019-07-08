package com.test.mybatis;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface INoticeDAO
{
	
	//게시물  리스트  출력 
		public ArrayList<NoticeDTO> list(String reqpage);
	//게시물  검색후 리스트 출력 
		public ArrayList<NoticeDTO> searchlist(@Param("keyword")String keyword,@Param("reqpage")String reqpage);
		
	//게시물 총 갯수 출력
		public int count(String keyword);
}
