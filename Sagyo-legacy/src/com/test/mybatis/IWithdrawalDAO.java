package com.test.mybatis;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface IWithdrawalDAO
{
	/*
	//게시물  리스트  출력 
		public ArrayList<FaqDTO> list(@Param("keyword")String keyword,@Param("reqpage")String reqpage);
	//게시물  검색후 리스트 출력 
		public ArrayList<FaqDTO> searchlist(@Param("keyword")String keyword,@Param("reqpage")String reqpage);
		
	//게시물 총 갯수 출력
		public int count(String keyword);
	*/	
	// 아이디 기반으로 닉네임만 불러오는거 ~ 
		public ArrayList<WithdrawalDTO> nickname(String userid); 
	// ID와 PW 가 맞는지 확인하는 dao 생성용
		public int idpwcheck(WithdrawalDTO w);
		
	// del_user테이블에 insert하는 구문
		public int del_user(String userid);
}
