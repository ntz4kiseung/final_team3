package com.test.mybatis;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface ICsDAO
{
	
	//★ 기존 INoticeDAO 
	//게시물  리스트  출력 
	public ArrayList<CsDTO> list(@Param("keyword")String keyword,@Param("reqpage")String reqpage);
	//게시물  검색후 리스트 출력 
	public ArrayList<CsDTO> searchlist(@Param("keyword")String keyword,@Param("reqpage")String reqpage);
	//게시물 총 갯수 출력
	public int count(String keyword);	

	
	//★ 기존 IFaqDAO 
	
	//게시물  리스트  출력 
	public ArrayList<CsDTO> faqlist(@Param("keyword")String keyword,@Param("reqpage")String reqpage);
//게시물  검색후 리스트 출력 
	public ArrayList<CsDTO> faqsearchlist(@Param("keyword")String keyword,@Param("reqpage")String reqpage);
	//게시물 총 갯수 출력
		public int faqcount(String keyword);	
	//★ 기존 IDirectQuestionCompletDAO 
	
	//1:1문의 입력 
	public int drwrite(CsDTO d);
	
	//★ 기존 IWithdrawalDAO
	
	// 아이디 기반으로 닉네임만 불러오는거 ~ 
	public String nickname(String userId); 
	// ID와 PW 가 맞는지 확인하는 dao 생성용
	
	public int idpwcheck(CsDTO w);
	
	// del_user테이블에 insert하는 구문
	public int del_user(String userId);
	
	
	
	
}
