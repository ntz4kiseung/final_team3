package com.test.mybatis;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface ICsDAO
{
	
	public ArrayList<CsDTO> noticeList(@Param("keyword")String keyword, @Param("pageNum")String pageNum);
	public int noticeTotalPageNum(@Param("keyword")String keyword);
	public int noticeTotalLargePageNum(@Param("keyword")String keyword);
	
	public ArrayList<CsDTO> faqList(@Param("keyword")String keyword, @Param("pageNum")String pageNum);
	public int faqTotalPageNum(@Param("keyword")String keyword);
	public int faqTotalLargePageNum(@Param("keyword")String keyword);	
	
	//1:1문의 입력 
	public int drwrite(CsDTO d);
	// 아이디 기반으로 닉네임만 불러오는거 ~ 
	public String nickname(String userId); 
	// ID와 PW 가 맞는지 확인하는 dao 생성용
	public int idpwcheck(CsDTO w);
	// del_user테이블에 insert하는 구문
	public int del_user(String userId);
}
