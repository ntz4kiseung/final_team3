package com.test.mybatis;

import java.util.ArrayList;

public interface INoticeDAO
{
	
	//게시물  리스트  출력 
		public ArrayList<NoticeDTO> list();
	//게시물  검색후 리스트 출력 
		public ArrayList<NoticeDTO> searchlist(NoticeDTO n);
}
